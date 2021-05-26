#!/bin/bash

STEP=1

echo "### Go Project Setup Script ###"
echo ""
echo "This script will guide you in the creation of a Go project folder"
echo ""
echo "[Step $STEP] Insert project folder name, without any spaces"

STEP=$(($STEP+1))

read PROJECT_NAME

echo
echo "[Step $STEP] Creating a new folder named $PROJECT_NAME"
echo
STEP=$(($STEP+1))

mkdir $PROJECT_NAME

cd $PROJECT_NAME

echo
echo "[Step $STEP] Initialising Git repository"
echo
STEP=$(($STEP+1))

git init

git branch -M main

echo
read -p "[Step $STEP] Do you want to set-up a remote repository to track this local repository? [y/n]" -n 1 -r IS_REMOTE
echo 
if [[ $IS_REMOTE =~ ^[Yy]$ ]]
then 
    echo "Insert remote repo name (HTTPS or SSH)"
    echo

    read REMOTE_REPO

    echo
    echo "Adding remote repository"
    echo

    STEP=$(($STEP+1))

    git remote add origin $REMOTE_REPO
fi

echo
echo "[Step $STEP] Creating README.md file"
echo

STEP=$(($STEP+1))

echo "# $PROJECT_NAME" > README.md

echo "[Step $STEP] Creating main.go"

STEP=$(($STEP+1))

echo "package main

func main(){

}" > main.go

echo
echo "[Step $STEP] Initialising Go module file"
echo "Insert github username"
read GITHUB_USERNAME
echo

STEP=$(($STEP+1))

MODULE_NAME="github.com/"+$GITHUB_USERNAME+"/"+$PROJECT_NAME
go mod init $MODULE_NAME

echo
echo "[Step $STEP] Creating Initial Commit"
echo

git add .

git commit -m "feat(all): Initial commit"

if [[ $IS_REMOTE =~ ^[Yy]$ ]]
then 
    git push -u origin main
fi