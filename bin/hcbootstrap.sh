#!/bin/bash
# Everett Kropf, 2016

GIT=/usr/bin/git
REPO=~/Dropbox/Source/hconfig

# Make sure we're working in the right directory.
cd $HOME

# Customise git.
hconfig="$GIT --git-dir=$HOME/.hconfig --work-tree=$HOME"

# Clone repository to home.
$GIT clone --bare $REPO $HOME/.hconfig

# Try checkout.
RESULT=/tmp/hcbs.${RANDOM}.txt
$hconfig checkout 2> $RESULT

if [ $? -ne 0 ]; then
    echo "Backing up existing files."
    BDIR=.config-backup

    if [ -d $BDIR ]; then
        echo "Backup directory already exists. Not overwriting."
        exit -1
    fi

    mkdir $BDIR

    files=$(cat $RESULT | egrep "\s+\." | awk {'print $1'})
    rsync --remove-source-files -aR $files $BDIR

    $hconfig checkout 2> $RESULT
fi
cat $RESULT

# Don't show untracked files (the rest of the home directory).
$hconfig config --local status.showUntrackedFiles no

echo "HConfig bootstrap complete."
