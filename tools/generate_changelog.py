#!/usr/bin/env python3
"""
Generate a PR-ready changelog by scanning git history and diffs.
Supports:
  1) Single-range mode: base (default upstream/master) → HEAD
  2) Two-way compare: --left <refA> vs --right <refB>, emitting two changelogs

Usage:
  python tools/generate_changelog.py [--base <ref>] [--since <ref>]
  python tools/generate_changelog.py --left <refA> --right <refB>
  python tools/generate_changelog.py --left <refA> --right <refB> --per-file-out outdir [--print-diffs]

Notes:
  - If --since is provided, the range is <since>..HEAD.
  - Otherwise, we compute merge-base between --base and HEAD and diff from there.
"""

from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from collections import defaultdict
from typing import Dict, Iterable, List, Optional, Set, Tuple


def run(cmd: List[str], cwd: Optional[str] = None) -> str:
    # Force UTF-8 decoding and replace undecodable bytes to prevent locale issues on Windows
    result = subprocess.run(
        cmd,
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf-8",
        errors="replace",
    )
    if result.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}\n{result.stderr}")
    return result.stdout


def ref_exists(ref: str) -> bool:
    try:
        run(["git", "rev-parse", "--verify", ref])
        return True
    except Exception:
        return False


def compute_base_ref(base: Optional[str]) -> str:
    if base:
        return base
    # Prefer upstream/master if exists, else origin/master
    if ref_exists("upstream/master"):
        return "upstream/master"
    return "origin/master"


def compute_start_commit(base_ref: str, since_ref: Optional[str]) -> str:
    if since_ref:
        return since_ref
    # merge-base base_ref..HEAD
    return run(["git", "merge-base", base_ref, "HEAD"]).strip()


def gather_changed_files(start: str, end: str = "HEAD") -> List[Tuple[str, str]]:
    # Returns list of (status, path)
    out = run(["git", "diff", "--name-status", f"{start}..{end}"]).splitlines()
    changed: List[Tuple[str, str]] = []
    for line in out:
        if not line.strip():
            continue
        parts = line.split("\t")
        status = parts[0]
        path = parts[-1]
        changed.append((status, path))
    return changed


def gather_commits(start: str, end: str = "HEAD") -> List[Tuple[str, str, str]]:
    # Returns list of (sha, subject, body)
    fmt = "%H\t%s\t%b"
    out = run(["git", "log", f"{start}..{end}", f"--format={fmt}"])
    commits: List[Tuple[str, str, str]] = []
    for line in out.splitlines():
        if not line.strip():
            continue
        parts = line.split("\t", 2)
        while len(parts) < 3:
            parts.append("")
        sha, subject, body = parts[0], parts[1], parts[2]
        commits.append((sha, subject.strip(), body.strip()))
    return commits


KEYWORD_TO_TAG = [
    # gameplay/system specific
    (re.compile(r"\btrade|trade\.dm|trade_stations|_trade_station|LSS\b", re.I), "refactor"),
    (re.compile(r"\bprice|export|balance|econom(y|ic)|cost\b", re.I), "balance"),
    (re.compile(r"\bfix|bug|hotfix|error|runtime|crash|loop\b", re.I), "fix"),
    (re.compile(r"\bui|ux|console|terminal|screen|interface|tmpl|tgui\b", re.I), "tweak"),
    # assets
    (re.compile(r"\.(dmi|png|gif|ogg|wav|mp3)$", re.I), "imageadd"),
    # infra
    (re.compile(r"^\.github/|workflows|ci|changelog|docs?\b", re.I), "config"),
    # code changes
    (re.compile(r"\.dm$|\.ts$|\.tsx$|\.scss$|\.js$|\.py$", re.I), "code"),
]


def classify_change(path: str, subject: str, body: str) -> str:
    hay = f"{path} {subject} {body}".lower()
    for pattern, tag in KEYWORD_TO_TAG:
        if pattern.search(hay):
            return tag
    return "code"


def group_changes(changed: List[Tuple[str, str]], commits: List[Tuple[str, str, str]]) -> Dict[str, Set[str]]:
    # Build a quick map of file -> commit subjects to enrich descriptions
    file_to_subjects: Dict[str, List[str]] = defaultdict(list)
    for sha, subject, body in commits:
        # naive: attach subjects globally; we will at least include a few notable subjects
        if subject:
            file_to_subjects["__all__"].append(subject)

    tag_to_items: Dict[str, Set[str]] = defaultdict(set)
    for status, path in changed:
        # human-friendly path focus
        leaf = os.path.basename(path)
        dir_hint = os.path.dirname(path).replace("\\", "/")

        # Construct a concise description per file
        status_word = {
            "A": "added",
            "M": "updated",
            "D": "removed",
            "R": "renamed",
            "C": "copied",
        }.get(status[:1], "changed")

        desc = f"{status_word} {path}"

        # Heuristic: find a matching tag based on path and notable subjects
        notable_subj = next(iter(file_to_subjects.get("__all__", [])), "")
        tag = classify_change(path, notable_subj, "")

        tag_to_items[tag].add(desc)
    return tag_to_items


def summarize_commits(commits: List[Tuple[str, str, str]]) -> List[str]:
    subjects = [s for _, s, _ in commits if s]
    # Deduplicate while preserving order
    seen: Set[str] = set()
    ordered: List[str] = []
    for s in subjects:
        key = s.strip().lower()
        if key in seen:
            continue
        seen.add(key)
        ordered.append(s.strip())
    return ordered[:25]


def build_changelog(tag_to_items: Dict[str, Set[str]], notable_commit_subjects: List[str],
                    heading: Optional[str] = None,
                    per_file_details: Optional[Dict[str, List[str]]] = None) -> str:
    # Order of tags for output
    tag_order = [
        "refactor",
        "tweak",
        "balance",
        "fix",
        "imageadd",
        "code",
        "config",
    ]

    lines: List[str] = []
    lines.append("### About The Pull Request" if not heading else f"### {heading}")
    lines.append("<details>")
    lines.append("<summary>")
    lines.append("\tAbout The Pull Request")
    lines.append("</summary>")
    lines.append("<hr>")
    lines.append("")
    if notable_commit_subjects:
        lines.append("Key themes (from commit history):")
        for s in notable_commit_subjects:
            lines.append(f"- {s}")
        lines.append("")
    lines.append("This changelog was auto-generated by analyzing file changes and commit messages across the selected range.")
    lines.append("")
    lines.append("<hr>")
    lines.append("</details>")
    lines.append("")
    lines.append("## Changelog")
    lines.append(":cl:")

    for tag in tag_order:
        items = sorted(tag_to_items.get(tag, set()))
        if not items:
            continue
        # Summarize multiple similar entries to avoid flooding the CL
        if len(items) > 15:
            lines.append(f"{tag}: {len(items)} file-level changes (see git history for details)")
        else:
            for item in items:
                # Convert file-level description to player-facing when possible
                pretty = item
                if tag == "refactor":
                    pretty = re.sub(r"^updated |^changed ", "refactored ", pretty)
                elif tag == "tweak":
                    pretty = pretty.replace("updated ", "tweaked ")
                elif tag == "fix":
                    pretty = pretty.replace("updated ", "fixed ")
                lines.append(f"{tag}: {pretty}")

    lines.append(":cl:")

    # Optional detailed section
    if per_file_details:
        lines.append("")
        lines.append("### Detailed changes (auto-parsed from diffs)")
        for path in sorted(per_file_details.keys()):
            bullets = per_file_details[path]
            if not bullets:
                continue
            lines.append(f"- {path}")
            for b in bullets[:50]:  # cap per-file for brevity
                lines.append(f"  - {b}")
    return "\n".join(lines)


def gather_unified_diff(start: str, end: str = "HEAD") -> str:
    # -U0 for zero context; easier to isolate exact additions/removals
    return run(["git", "diff", "-U0", f"{start}..{end}"])


def write_per_file_diffs(start: str, end: str, outdir: str, print_diffs: bool = False) -> List[str]:
    os.makedirs(outdir, exist_ok=True)
    changed = gather_changed_files(start, end)
    written: List[str] = []
    for _status, path in changed:
        # Sanitize filename
        safe = path.replace("..", ".").replace("\\", "/")
        safe = safe.replace("/", "__")
        dest = os.path.join(outdir, f"{safe}.diff")
        try:
            diff = run(["git", "diff", "-U0", f"{start}..{end}", "--", path])
        except Exception:
            diff = ""
        with open(dest, "w", encoding="utf-8", errors="replace") as f:
            f.write(diff)
        written.append(dest)
        if print_diffs:
            header = f"===== {path} ({start}..{end}) ====="
            print(header)
            print(diff)
            if not diff:
                print("(no diff content)\n")
    return written


SYMBOL_PATTERNS = [
    re.compile(r"^\+\s*#\s*define\s+([A-Za-z0-9_]+)\b"),
    re.compile(r"^\+\s*var\s*/[A-Za-z0-9_./]+\b"),
    re.compile(r"^\+\s*/(obj|mob|datum|area|turf|client)(/[A-Za-z0-9_]+)+\b"),
    re.compile(r"^\+\s*proc\s*/[A-Za-z0-9_./]+\("),
    re.compile(r"^\+\s*[A-Za-z0-9_]+\s*=\s*[^=].*"),
    re.compile(r"^\+\s*\w+\s*:\s*"),  # templates/yaml-like labels
    re.compile(r"^\+\s*export\s+|^\+\s*import\s+", re.I),
]


def describe_added_line(line: str) -> Optional[str]:
    txt = line[1:].strip()  # drop leading '+'
    if not txt or txt.startswith("+++"):
        return None
    for pat in SYMBOL_PATTERNS:
        m = pat.search(line)
        if m:
            # Prefer first capturing group if present
            if m.groups():
                return f"added {m.group(1)}"
            return f"added: {txt[:140]}"
    # fallback: short summary
    return f"added: {txt[:140]}"


def describe_removed_line(line: str) -> Optional[str]:
    txt = line[1:].strip()  # drop leading '-'
    if not txt or txt.startswith("---"):
        return None
    return f"removed: {txt[:140]}"


def parse_diff_details(unified_diff: str) -> Dict[str, List[str]]:
    per_file: Dict[str, List[str]] = defaultdict(list)
    current_file: Optional[str] = None

    for raw in unified_diff.splitlines():
        if raw.startswith("diff --git "):
            current_file = None
            continue
        if raw.startswith("+++ b/"):
            current_file = raw.split("+++ b/", 1)[-1]
            # Initialize storage
            per_file.setdefault(current_file, [])
            continue
        if not current_file:
            continue
        if raw.startswith("+"):
            desc = describe_added_line(raw)
            if desc:
                per_file[current_file].append(desc)
        elif raw.startswith("-"):
            desc = describe_removed_line(raw)
            if desc:
                per_file[current_file].append(desc)
    # Trim empty files
    return {p: v for p, v in per_file.items() if any(v)}


def main(argv: Optional[List[str]] = None) -> int:
    # Ensure Windows console can display unicode without crashing
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[attr-defined]
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[attr-defined]
    except Exception:
        pass
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group()
    parser.add_argument("--base", default=None, help="Base reference to compare against (default upstream/master or origin/master)")
    parser.add_argument("--since", default=None, help="Optional starting ref; if set uses <since>..HEAD")
    parser.add_argument("--left", default=None, help="Left ref for two-way comparison (e.g., upstream/master)")
    parser.add_argument("--right", default=None, help="Right ref for two-way comparison (e.g., soj/master)")
    parser.add_argument("--per-file-out", dest="per_file_out", default=None, help="If set, write one unified diff per changed file into this directory and print an index. Disables verbose inline detail output.")
    parser.add_argument("--print-diffs", dest="print_diffs", action="store_true", help="When used with --per-file-out, also print each file's unified diff to stdout with headers.")
    args = parser.parse_args(argv)

    # Two-way compare mode
    if args.left and args.right:
        left = args.left
        right = args.right
        # Determine independent base points to include only unique changes per side
        # We'll compute merge-base and then compare merge-base..left and merge-base..right separately
        mb = run(["git", "merge-base", left, right]).strip()

        # Left-only changelog
        left_changed = gather_changed_files(mb, left)
        left_commits = gather_commits(mb, left)
        left_tag_items = group_changes(left_changed, left_commits)
        left_notable = summarize_commits(left_commits)

        # Right-only changelog
        right_changed = gather_changed_files(mb, right)
        right_commits = gather_commits(mb, right)
        right_tag_items = group_changes(right_changed, right_commits)
        right_notable = summarize_commits(right_commits)

        if args.per_file_out:
            left_files = write_per_file_diffs(mb, left, os.path.join(args.per_file_out, "left"), print_diffs=args.print_diffs)
            right_files = write_per_file_diffs(mb, right, os.path.join(args.per_file_out, "right"), print_diffs=args.print_diffs)
            print(f"Per-file diffs written: {len(left_files)} left, {len(right_files)} right")
            print(f"Left dir: {os.path.join(args.per_file_out, 'left')}")
            print(f"Right dir: {os.path.join(args.per_file_out, 'right')}")
            # Minimal headings, no inline detail to keep output small
            left_output = build_changelog(left_tag_items, left_notable, heading=f"Changelog for {left} (vs {right})", per_file_details=None)
            right_output = build_changelog(right_tag_items, right_notable, heading=f"Changelog for {right} (vs {left})", per_file_details=None)
        else:
            # Keep existing inline detail mode
            left_diff = gather_unified_diff(mb, left)
            right_diff = gather_unified_diff(mb, right)
            left_details = parse_diff_details(left_diff)
            right_details = parse_diff_details(right_diff)
            left_output = build_changelog(left_tag_items, left_notable, heading=f"Changelog for {left} (vs {right})", per_file_details=left_details)
            right_output = build_changelog(right_tag_items, right_notable, heading=f"Changelog for {right} (vs {left})", per_file_details=right_details)

        print(left_output)
        print("\n\n---\n\n")
        print(right_output)
        return 0

    # Single-range mode
    base_ref = compute_base_ref(args.base)
    start_ref = compute_start_commit(base_ref, args.since)

    changed = gather_changed_files(start_ref)
    commits = gather_commits(start_ref)
    details = None
    if args.per_file_out:
        write_per_file_diffs(start_ref, "HEAD", args.per_file_out, print_diffs=args.print_diffs)
    else:
        diff_text = gather_unified_diff(start_ref)
        details = parse_diff_details(diff_text)

    tag_to_items = group_changes(changed, commits)
    notable = summarize_commits(commits)
    output = build_changelog(tag_to_items, notable, per_file_details=details)
    print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


