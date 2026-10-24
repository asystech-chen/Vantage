#!/usr/bin/env python3
"""Fail if any built localization FTL contains duplicate message IDs."""

from __future__ import annotations

import argparse
import collections
import glob
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from l10n_merge import find_blocks  # noqa: E402


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument(
        "paths",
        nargs="*",
        help="FTL files or directories (default: built localization trees)",
    )
    ap.add_argument("--force", action="store_true", help="scan even if the build tree is stale")
    args = ap.parse_args()

    paths = args.paths or glob.glob(
        "librewolf-*/obj-*/dist/bin/browser/localization/**/*.ftl", recursive=True
    )
    files: list[Path] = []
    for p in paths:
        path = Path(p)
        if path.is_dir():
            files.extend(path.rglob("*.ftl"))
        else:
            files.append(path)

    if not files:
        print("no built localization files found; skipped")
        return 0

    if not args.force:
        overlays = list(Path("l10n").rglob("*.inc.ftl"))
        if overlays:
            newest_overlay = max(p.stat().st_mtime for p in overlays)
            newest_build = max(p.stat().st_mtime for p in files)
            if newest_build < newest_overlay:
                print("built localization is older than l10n overlays; skipped (rebuild first)")
                return 0

    bad = 0
    for path in files:
        lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        counts = collections.Counter(msg_id for msg_id, _, _ in find_blocks(lines))
        dups = {k: v for k, v in counts.items() if v > 1}
        if dups:
            bad += 1
            print(f"{path}:")
            for msg_id, count in sorted(dups.items()):
                print(f"  {msg_id} x{count}")

    if bad:
        print(f"ERROR: {bad} file(s) contain duplicate Fluent IDs")
        return 1
    print(f"OK: {len(files)} localization files, no duplicate IDs")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
