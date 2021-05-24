#!/bin/bash

STEP=1

echo "### Go Project Setup Script ###"
echo ""
echo "This script will guide you in the creation of a Go project folder"
echo ""
echo "[Step $STEP] Insert project folder name, without any spaces"

STEP=$(($STEP+1))

read PROJECT_NAME

echo "[Step $STEP] Creating a new folder named $PROJECT_NAME"
STEP=$(($STEP+1))

mkdir $PROJECT_NAME

cd $PROJECT_NAME

echo "[Step $STEP] Initialising Git repository"
STEP=$(($STEP+1))

git init

git branch -M main

echo "[Step $STEP] Insert remote repo name (HTTPS or SSH)"

read REMOTE_REPO

# if [ ($(echo $REMOTE_REPO | head -c 1) -neq "h" && $(echo $REMOTE_REPO | head -c 1) -neq "s") ]
# if [[ ($REMOTE_REPO "https* || $REMOTE_REPO != ssh*) ]]
# then
#     echo "Not a valid remote repository"
#     exit 1
# fi

echo "Adding remote repository"

STEP=$(($STEP+1))

git remote add origin $REMOTE_REPO

echo "[Step $STEP] Creating README.md file"

STEP=$(($STEP+1))

echo "# $PROJECT_NAME" > README.md

echo "[Step $STEP] Creating main.go"

STEP=$(($STEP+1))

echo "package main

func main(){

}" > main.go

echo "[Step $STEP] Initialising Go module file"

STEP=$(($STEP+1))

go mod init main.go

git add .

git commit -m "feat(all): Initial commit"

git push -u origin main