#!/usr/bin/env python3
"""Merge a Vantage .inc.ftl overlay into an upstream FTL file.

Vantage overlays used to be appended blindly. If upstream already had the same
message ID, the file ended up with two entries and Fluent kept the *first*
(upstream) one, silently ignoring our text. This module replaces existing
message blocks instead, and only appends IDs that do not exist yet.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path

MSG_RE = re.compile(r"^(-?[A-Za-z][\w-]*)\s*=")


def _is_continuation(line: str) -> bool:
    return bool(line) and line[0].isspace() and bool(line.strip())


def find_blocks(lines: list[str]) -> list[tuple[str, int, int]]:
    """Return (message_id, start, end) for each FTL message/term."""
    out: list[tuple[str, int, int]] = []
    i = 0
    while i < len(lines):
        m = MSG_RE.match(lines[i])
        if not m:
            i += 1
            continue
        start = i
        i += 1
        while i < len(lines) and _is_continuation(lines[i]):
            i += 1
        out.append((m.group(1), start, i))
    return out


def parse_overlay(text: str) -> list[tuple[str, list[str]]]:
    lines = text.splitlines()
    return [(mid, lines[s:e]) for mid, s, e in find_blocks(lines)]


def replace_block(lines: list[str], msg_id: str, block: list[str]) -> tuple[list[str], bool]:
    spans = [(s, e) for mid, s, e in find_blocks(lines) if mid == msg_id]
    if not spans:
        return lines, False
    out: list[str] = []
    last = 0
    first = True
    for s, e in spans:
        out.extend(lines[last:s])
        if first:
            out.extend(block)
            first = False
        last = e
    out.extend(lines[last:])
    return out, True


def merge_text(target_text: str, overlay_text: str) -> tuple[str, int, int, list[str]]:
    lines = target_text.replace("\r\n", "\n").splitlines()
    blocks = parse_overlay(overlay_text)
    replaced = 0
    appended = 0
    replaced_ids: list[str] = []

    for msg_id, block in blocks:
        lines, did_replace = replace_block(lines, msg_id, block)
        if did_replace:
            replaced += 1
            replaced_ids.append(msg_id)
        else:
            if lines and lines[-1].strip():
                lines.append("")
            lines.extend(block)
            appended += 1

    return "\n".join(lines) + "\n", replaced, appended, replaced_ids


def merge_overlay_file(target: Path, overlay: Path, write: bool = True) -> tuple[int, int, list[str]]:
    new_text, replaced, appended, ids = merge_text(
        target.read_text(encoding="utf-8"), overlay.read_text(encoding="utf-8")
    )
    if write:
        target.write_text(new_text, encoding="utf-8")
    return replaced, appended, ids


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("target", type=Path)
    ap.add_argument("overlay", type=Path)
    ap.add_argument("--check", action="store_true", help="do not write, just report")
    args = ap.parse_args()

    replaced, appended, ids = merge_overlay_file(args.target, args.overlay, write=not args.check)
    print(f"{args.overlay} -> {args.target}: replaced {replaced}, appended {appended}")
    for msg_id in ids:
        print(f"  replaced: {msg_id}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
