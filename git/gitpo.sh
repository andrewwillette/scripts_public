#!/usr/bin/env bash
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./gitpo.sh

Git push origin, selecting branch via fuzzy finding.

'
    exit
fi
branch=$(git branch| sed -E 's/^[[:space:]]|\*|[[:space:]] *//g' | fzf)

if [ -z "$branch" ]; then
    exit 0
fi

git push origin "$branch"
