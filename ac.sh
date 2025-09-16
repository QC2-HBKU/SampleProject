#!/bin/bash

# Usage: ./ac.sh [username] [branch]
# - username: defaults to "guest"
# - branch:   defaults to "main"

username=${1:-guest}
branch=${2:-main}

commit_msg="${username} has committed at $(date +'%Y-%m-%d %H:%M:%S')"

# Add all changes
git add .

# Commit changes
if ! git commit -m "$commit_msg"; then
  echo "Error: Failed to commit changes."
  exit 1
fi

# Push changes to the specified/default branch
if ! git push origin "$branch"; then
  echo "Error: Failed to push changes to $branch branch."
  exit 1
fi

echo "Changes committed and pushed successfully."



