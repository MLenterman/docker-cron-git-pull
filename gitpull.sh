#!/bin/sh

if [ ! -d .git ]; then
    echo "Error: Current directory (`pwd`) is not a git repository!"
    exit 2
fi

echo "fetching changes from remote repository..."
git fetch

echo "Comparing local and remote commits..."
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})
echo -e "Local:\t $LOCAL"
echo -e "Remote:\t $REMOTE"

if [ $LOCAL != $REMOTE ]; then
    echo "pulling changes from remote repository..."
    git pull origin $(git rev-parse --abbrev-ref HEAD)
else
    echo "already up-to-date with remote repository."
fi
