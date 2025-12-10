#!/usr/bin/env python3
"""
Scan previous commits for certain keywords and create a new changelog commit
with those entries between :cl: and /:cl: for the bot to pick up.
"""

import os
import sys
from git import Repo

# Keywords to match
KEYWORDS = [
    'tweak',
    'soundadd',
    'sounddel',
    'add',
    'del',
    'rscadd',
    'rscdel',
    'imageadd',
    'imagedel',
    'maptweak',
    'spellcheck',
    'experiment',
    'balance',
    'admin',
    'server',
    'fix'
]

# Path to your git repo (use current directory)
REPO_PATH = os.getcwd()

def main():
    repo = Repo(REPO_PATH)
    if repo.bare:
        print("Error: Not a git repository!")
        sys.exit(1)

    changelog_entries = []

    print("Scanning previous commits for keywords...")
    for commit in repo.iter_commits('main'):  # adjust branch if needed
        message_lines = commit.message.splitlines()
        for line in message_lines:
            line_lower = line.lower()
            if any(line_lower.startswith(k) for k in KEYWORDS):
                changelog_entries.append(line.strip())

    if not changelog_entries:
        print("No matching commit messages found.")
        return

    changelog_content = ":cl:\n" + "\n".join(changelog_entries) + "\n/:cl:\n"

    # Write to a temporary file
    changelog_file = "bot_changelog.txt"
    with open(changelog_file, "w", encoding="utf-8") as f:
        f.write(changelog_content)

    # Stage and commit
    repo.index.add([changelog_file])
    commit_message = "Generated changelog entries for bot"
    repo.index.commit(commit_message)

    print(f"Created new commit with {len(changelog_entries)} changelog entries in {changelog_file}.")

if __name__ == "__main__":
    main()
