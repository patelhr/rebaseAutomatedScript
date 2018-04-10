#!/bin/bash

currentBranchName=$(git symbolic-ref -q HEAD)
currentBranchName=${currentBranchName##refs/heads/}
currentBranchName=${currentBranchName:-HEAD}

if [ $currentBranchName != 'dev' ]; then
    git checkout dev;
fi
git pull 
git checkout ${currentBranchName}
if [ $currentBranchName != 'dev' ]; then
    echo "*************Rebasing start***************";
    git rebase dev;
fi
