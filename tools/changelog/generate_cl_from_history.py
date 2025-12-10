import requests
import os

GITHUB_TOKEN = os.getenv("BOT_TOKEN")
REPO = "epic-new-soj-thing/Sojourn-Iskhod"
WORKFLOW_ID = "generate-changelog.yml"  # workflow filename
HEADERS = {"Authorization": f"token {GITHUB_TOKEN}"}

for pr_sha in merged_pr_shas:
    data = {"ref": pr_sha}
    r = requests.post(
        f"https://api.github.com/repos/{REPO}/actions/workflows/{WORKFLOW_ID}/dispatches",
        headers=HEADERS,
        json=data
    )
    print(f"Triggered workflow for PR commit {pr_sha}: {r.status_code}")
