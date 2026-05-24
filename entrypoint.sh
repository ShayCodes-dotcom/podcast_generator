#!/bin/bash

echo "==================================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git remote set-url origin "https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

git add -A && git commit -m "Update Feed"

git push --set-upstream origin ${GITHUB_REF_NAME}

echo "==================================="