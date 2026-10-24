#!/usr/bin/env python3
"""Merge Vantage settings files.

settings/librewolf.cfg  — annotated copy of upstream LibreWolf librewolf.cfg.
                          Lines we disable/change are prefixed with
                          //@VANTAGE-DISABLED@; Vantage-only content lives in
                          settings/vantage.cfg and is referenced by
                          // @VANTAGE_BLOCK:<n>@ markers.
settings/vantage.cfg    — Vantage-only prefs and JS blocks.

Usage:
  scripts/cfg-merge.py --merge --output path      # build a merged cfg
  scripts/cfg-merge.py --check                    # validate markers/blocks
  scripts/cfg-merge.py --snapshot --output path   # reconstruct upstream cfg
  scripts/cfg-merge.py --diff-upstream new.cfg    # compare with a new upstream
"""

from __future__ import annotations

import argparse
import difflib
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BASE = ROOT / "settings" / "librewolf.cfg"
VANTAGE = ROOT / "settings" / "vantage.cfg"

DISABLED = "//@VANTAGE-DISABLED@"
META = "//@VANTAGE-META@"
BLOCK_RE = re.compile(r"^// @VANTAGE_BLOCK:(\d+)@$")


def read_lines(path: Path) -> list[str]:
    return path.read_text(encoding="utf-8").splitlines()


def parse_blocks(path: Path) -> dict[int, list[str]]:
    blocks: dict[int, list[str]] = {}
    current: int | None = None
    buf: list[str] = []

    def flush() -> None:
        if current is not None:
            if current in blocks:
                raise SystemExit(f"duplicate block {current} in {path}")
            blocks[current] = buf[:]

    for line in read_lines(path):
        m = BLOCK_RE.match(line)
        if m:
            flush()
            current = int(m.group(1))
            buf = []
        elif current is not None:
            buf.append(line)
    flush()
    return blocks


def build_merged() -> tuple[list[str], dict[int, list[str]], list[int]]:
    base = read_lines(BASE)
    blocks = parse_blocks(VANTAGE)
    out: list[str] = []
    used: list[int] = []

    if not base or base[0].strip() != "null;":
        raise SystemExit(f"{BASE} 首行不是 null;")

    for line in base:
        m = BLOCK_RE.match(line)
        if m:
            bid = int(m.group(1))
            if bid in used:
                raise SystemExit(f"marker {bid} 在 {BASE} 中重复出现")
            if bid not in blocks:
                raise SystemExit(f"marker {bid} 在 {VANTAGE} 中找不到对应块")
            out.extend(blocks[bid])
            used.append(bid)
        else:
            out.append(line)

    unused = sorted(set(blocks) - set(used))
    return out, blocks, unused


def snapshot_lines() -> list[str]:
    out: list[str] = []
    for line in read_lines(BASE):
        if line.startswith(META):
            continue
        if BLOCK_RE.match(line):
            continue
        if line.startswith(DISABLED):
            out.append(line[len(DISABLED):])
        else:
            out.append(line)
    return out


def write_output(lines: list[str], output: str | None) -> None:
    text = "\n".join(lines) + "\n"
    if output in (None, "-"):
        sys.stdout.write(text)
    else:
        Path(output).write_text(text, encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--merge", action="store_true", help="merge base + vantage")
    ap.add_argument("--output", help="write to file (default: stdout); '-' = stdout")
    ap.add_argument("--check", action="store_true", help="validate markers and blocks")
    ap.add_argument("--snapshot", action="store_true", help="reconstruct upstream cfg")
    ap.add_argument("--diff-upstream", metavar="FILE", help="diff snapshot against upstream FILE")
    args = ap.parse_args()

    if not BASE.exists():
        raise SystemExit(f"missing {BASE}")
    if not VANTAGE.exists():
        raise SystemExit(f"missing {VANTAGE}")

    if args.diff_upstream:
        upstream = Path(args.diff_upstream)
        if not upstream.exists():
            raise SystemExit(f"missing upstream file {upstream}")
        old = snapshot_lines()
        new = read_lines(upstream)
        diff = list(
            difflib.unified_diff(
                old, new, fromfile="our-upstream-snapshot", tofile=str(upstream), lineterm=""
            )
        )
        if diff:
            print("\n".join(diff))
            return 1
        print("upstream snapshot matches")
        return 0

    if args.snapshot:
        write_output(snapshot_lines(), args.output)
        return 0

    merged, blocks, unused = build_merged()

    if args.check:
        if unused:
            print(f"unused Vantage blocks: {unused}", file=sys.stderr)
            return 1
        if any(BLOCK_RE.match(line) for line in merged):
            print("unresolved block marker in merged output", file=sys.stderr)
            return 1
        print(f"OK: {len(blocks)} blocks, merged {len(merged)} lines")
        return 0

    write_output(merged, args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
