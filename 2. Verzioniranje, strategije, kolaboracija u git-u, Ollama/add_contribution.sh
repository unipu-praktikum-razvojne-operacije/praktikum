#!/usr/bin/env bash
# Adds one contribution to the shared course repository (week 2, block A).
#
# Creates "<timestamp>.txt" in the repository root, where <timestamp> is the
# current Europe/Zagreb local time in ISO 8601 format to the second
# (e.g. 2026-10-20T10:15:42, no milliseconds, no time zone suffix).
# The file contains $USER. The script commits the file and then adds one empty commit.
#
# Usage (inside the shared repository, on your own branch):
#   bash add_contribution.sh
#
# Note: ":" is not a valid file name character on Windows, so the shared repository
# can only be checked out on Linux, WSL or macOS (not with Git for Windows).
set -euo pipefail

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: run this script inside the shared repository." >&2
  exit 1
fi
cd "$(git rev-parse --show-toplevel)"

branch=$(git branch --show-current)
if [ -z "$branch" ] || [ "$branch" = "main" ]; then
  echo "ERROR: you are on '${branch:-detached HEAD}'. Work on your own branch:" >&2
  echo "  git checkout -b feature/\$(gh api user -q .login)" >&2
  exit 1
fi

user_name="${USER:-$(whoami)}"
timestamp=$(TZ=Europe/Zagreb date +%Y-%m-%dT%H:%M:%S)
file="${timestamp}.txt"

if [ -e "$file" ]; then
  echo "ERROR: $file already exists, wait a second and run the script again." >&2
  exit 1
fi

echo "$user_name" > "$file"

git add "$file"
git commit -m "feat: add contribution from $user_name"
git commit --allow-empty -m "chore: empty commit from $user_name"

echo
echo "Created $file and 2 commits on branch $branch:"
git log --oneline -2
echo
echo "Next steps:"
echo "  git push -u origin $branch"
echo "  gh pr create --base main --title \"feat: add contribution from $user_name\" --body \"Week 2 collaboration exercise\""
