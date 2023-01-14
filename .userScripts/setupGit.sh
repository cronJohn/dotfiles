#!/bin/bash

echo "Setting up author identity..."

echo "What is your email? (noreply email is recommended)"
read git_email

echo "What is your name?"
read git_username

git config --global user.email "'$git_email'"
git config --global user.name "'$git_username'"
