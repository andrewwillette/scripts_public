#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitco.sh

Fuzzy find checkout a git branch. Branches are sorted by most recent commit.

'
    exit
fi

# if arg is provdied, checkout that branch
if [ -n "$1" ]; then
    git checkout "$1"
    exit
fi

branch=$(git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)'| sed -E 's/^[[:space:]]|\*|[[:space:]] *//g' | fzf --tac)

if [ -z "$branch" ]; then
    exit 0
fi

git checkout "$branch"
