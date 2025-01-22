#!/bin/bash


set -e

if [ -z "$1" ]; then
        echo "No Commit Message Provided"
else
        if [ ! -d ".git" ]; then
                echo "This is not a git repository. Please navigate to one befo$
                exit 1
        fi

        git add .
        git commit -m "$1"
        git push

        echo "Changes have been commited and pushed successfully"
fi