#! /usr/bin/env bash

set -euo pipefail

is_git_repo() {
	[ -d "$1/.git" ]
}

is_out_of_date() {
	# git -C "$1" fetch
	local status
	status="$(git -C "${1}" status)"
	if [[ $status == *"Your branch is up-to-date with 'origin/master'"* ]] || [[ $status == *"Your branch is up-to-date with 'origin/main'"* ]]; then
		return 1
	else
		return 0
	fi
}

check_repos_and_report_status() {
	local base_dir="$1"
	while IFS= read -r -d '' repo; do
		repo_dir=$(dirname "$repo")
		if is_out_of_date "$repo_dir"; then
			echo "Repository '$repo_dir' is out of date."
		fi
	done < <(find "$base_dir" -type d -name '.git' -print0)
}

# Check repositories in the specified directory or current directory if no argument is given
if [ $# -eq 0 ]; then
	check_repos_and_report_status .
else
	check_repos_and_report_status "$1"
fi
