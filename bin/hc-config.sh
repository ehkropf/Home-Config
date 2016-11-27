#!/bin/bash
# Everett Kropf, 2016

GIT=/usr/bin/git
REPO=~/Dropbox/Source/hconfig.git

# Set appropriately for testing.
# THOME=$HOME/tmp/home
THOME=$HOME

# Make sure we're working in the right directory.
cd $THOME

# Customise git.
hconfig="$GIT --git-dir=$THOME/.hconfig --work-tree=$THOME"

# Clone repository to home.
$GIT clone --bare $REPO $THOME/.hconfig

# Fix remote tracking.
$hconfig remote remove origin
$hconfig remote add origin $REPO
$hconfig fetch origin
$hconfig branch -u origin/master master

# Try checkout.
RESULT=/tmp/hcbs.${RANDOM}.txt
$hconfig checkout 2> $RESULT

if [ $? -ne 0 ]; then
    echo "Backing up existing files."
    BDIR=.hconfig-backup

    if [ -d $BDIR ]; then
        echo "Backup directory already exists. Not overwriting."
        exit -1
    fi

    mkdir $BDIR

    files=$(cat $RESULT | egrep "^\s+\S" | awk {'print $1'})
    rsync --remove-source-files -aR $files $BDIR

    $hconfig checkout 2> $RESULT
fi
cat $RESULT
rm $RESULT

# Don't show untracked files (the rest of the home directory).
$hconfig config --local status.showUntrackedFiles no

echo "HConfig bootstrap complete."
