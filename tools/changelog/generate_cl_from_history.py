#!/usr/bin/env python3
"""
Scan all open or merged PRs in the repository, find lines in the description
matching certain keywords, and create a commit with those entries wrapped
between :cl: and /:cl: for the bot to pick up.
"""

import os
import sys
from github import Github
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

# Path to your git repo (current directory)
REPO_PATH = os.getcwd()

# Get GitHub token from environment
GITHUB_TOKEN = os.getenv("BOT_TOKEN")
if not GITHUB_TOKEN:
    print("Error: BOT_TOKEN environment variable not set")
    sys.exit(1)

# Replace with your repository full name (owner/repo)
REPO_NAME = "OWNER/REPO"  # <--- CHANGE THIS to your repo

def main():
    repo = Repo(REPO_PATH)
    if repo.bare:
        print("Error: Not a git repository!")
        sys.exit(1)

    github = Github(GITHUB_TOKEN)
    gh_repo = github.get_repo(REPO_NAME)

    changelog_entries = []

    print("Scanning PR descriptions for keywords...")

    # Scan merged PRs
    for pr in gh_repo.get_pulls(state="closed", sort="created", direction="asc"):
        if not pr.merged:
            continue

        description = pr.body or ""
        for line in description.splitlines():
            line_lower = line.strip().lower()
            if any(line_lower.startswith(k) for k in KEYWORDS):
                changelog_entries.append(line.strip())

    if not changelog_entries:
        print("No matching PR descriptions found.")
        return

    changelog_content = ":cl:\n" + "\n".join(changelog_entries) + "\n/:cl:\n"

    # Write to file
    changelog_file = "bot_changelog.txt"
    with open(changelog_file, "w", encoding="utf-8") as f:
        f.write(changelog_content)

    # Stage and commit
    repo.index.add([changelog_file])
    commit_message = "Generated changelog entries from PR descriptions"
    repo.index.commit(commit_message)

    print(f"Created new commit with {len(changelog_entries)} changelog entries in {changelog_file}.")


if __name__ == "__main__":
    main()
