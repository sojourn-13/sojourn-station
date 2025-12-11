#!/usr/bin/env python3
"""
This script scans all merged PRs in the repository and triggers
the existing GitHub Actions workflow (generate-changelog.yml)
for each PR commit. Includes debug logging.
"""

import os
import requests
from github import Github, Auth

# Configuration
GITHUB_TOKEN = os.getenv("BOT_TOKEN")
if not GITHUB_TOKEN:
    print("Error: BOT_TOKEN environment variable not set")
    exit(1)

REPO_NAME = "epic-new-soj-thing/Sojourn-Iskhod"  # owner/repo
WORKFLOW_FILE = "make_changelog.yml"         # workflow filename
MAX_PRS = 500                                    # optional limit
DEBUG = True

# GitHub API headers
HEADERS = {"Authorization": f"token {GITHUB_TOKEN}"}

# Authenticate with PyGithub
auth = Auth.Token(GITHUB_TOKEN)
gh = Github(auth=auth)
repo = gh.get_repo(REPO_NAME)

# Collect merged PR merge commits
merged_pr_shas = []
for pr in repo.get_pulls(state="closed", sort="created", direction="asc"):
    if pr.merged:
        merged_pr_shas.append(pr.merge_commit_sha)
        if DEBUG:
            print(f"Found merged PR #{pr.number}: {pr.title} (merge commit {pr.merge_commit_sha})")
    if MAX_PRS and len(merged_pr_shas) >= MAX_PRS:
        print(f"Reached MAX_PRS={MAX_PRS}, stopping collection.")
        break

print(f"Total merged PRs to process: {len(merged_pr_shas)}")

# Trigger workflow dispatch for each merged PR
for pr_sha in merged_pr_shas:
    data = {"ref": pr_sha}  # GitHub workflow dispatch needs a commit SHA or branch
    response = requests.post(
        f"https://api.github.com/repos/{REPO_NAME}/actions/workflows/{WORKFLOW_FILE}/dispatches",
        headers=HEADERS,
        json=data
    )

    if response.status_code == 204:
        print(f"Successfully triggered workflow for commit {pr_sha}")
    else:
        print(f"Failed to trigger workflow for commit {pr_sha}: {response.status_code} {response.text}")
