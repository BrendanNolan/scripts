#!/usr/bin/bash

# Check if input directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory $1 does not exist."
  exit 1
fi

# Recursively search for git repositories in the input directory
for repo_path in $(find $1 -type d -name .git); do
  cd "${repo_path%/.git}" # navigate to the root of the repository

  # Check if the repository has a remote
  if [ -z "$(git remote)" ]; then
    echo "${repo_path%/.git} has no remote"
  else
    # Check if the repository is up-to-date with its remote
    if [ -n "$(git fetch --dry-run 2>&1 | grep 'Your branch is up-to-date with ')" ]; then
      : # Do nothing if the repository is up-to-date with its remote
    else
      echo "${repo_path%/.git} is not up to date with its remote"
    fi
  fi

  cd - > /dev/null # navigate back to the original directory
done

