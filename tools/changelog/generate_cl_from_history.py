#!/usr/bin/env python3
"""
Scan all merged PRs in the repository, find lines in the description
matching certain keywords, and create a single commit with all entries
wrapped between :cl: and /:cl: for the bot to pick up.
"""

import os
import sys
from github import Github, Auth
from git import Repo

# Keywords to match
KEYWORDS = [
    'tweak', 'soundadd', 'sounddel', 'add', 'del', 'rscadd', 'rscdel',
    'imageadd', 'imagedel', 'maptweak', 'spellcheck', 'experiment', 'balance',
    'admin', 'server', 'fix'
]

# Path to your git repo (current directory)
REPO_PATH = os.getcwd()

# GitHub token from environment
GITHUB_TOKEN = os.getenv("BOT_TOKEN")
if not GITHUB_TOKEN:
    print("Error: BOT_TOKEN environment variable not set")
    sys.exit(1)

# Repository full name
REPO_NAME = "epic-new-soj-thing/Sojourn-Iskhod"  # Correct format: owner/repo

# Output changelog file
CHANGELOG_FILE = "bot_changelog.txt"


def main():
    # Open the local git repository
    repo = Repo(REPO_PATH)
    if repo.bare:
        print("Error: Not a git repository!")
        sys.exit(1)

    # Use modern PyGithub token auth
    auth = Auth.Token(GITHUB_TOKEN)
    github = Github(auth=auth)

    try:
        gh_repo = github.get_repo(REPO_NAME)
    except Exception as e:
        print(f"Error: Cannot access repository {REPO_NAME}: {e}")
        sys.exit(1)

    changelog_entries = []

    print("Scanning merged PR descriptions for keywords...")

    # Scan merged PRs
    for pr in gh_repo.get_pulls(state="closed", sort="created", direction="asc"):
        if not pr.merged:
            continue

        description = pr.body or ""
        for line in description.splitlines():
            line_clean = line.strip()
            line_lower = line_clean.lower()
            if any(line_lower.startswith(k) for k in KEYWORDS):
                if line_clean not in changelog_entries:
                    changelog_entries.append(line_clean)

    if not changelog_entries:
        print("No matching PR descriptions found. Nothing to commit.")
        return

    # Format changelog
    changelog_content = ":cl:\n" + "\n".join(changelog_entries) + "\n/:cl:\n"

    # Write to file
    with open(CHANGELOG_FILE, "w", encoding="utf-8") as f:
        f.write(changelog_content)

    # Stage and commit
    repo.index.add([CHANGELOG_FILE])
    commit_message = "Generated changelog entries from merged PRs"
    repo.index.commit(commit_message)

    print(f"Created a single commit with {len(changelog_entries)} changelog entries in {CHANGELOG_FILE}.")


if __name__ == "__main__":
    main()
