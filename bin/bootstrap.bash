#!/bin/bash

statline ()
{
    echo -e "\n--=== $1 ===--"
}

HPREFIX=~
while getopts ":p:" opt; do
    case $opt in
        p)
            if [[ ! -d $OPTARG ]]; then
                >&2 echo Invalid directory: $OPTARG
                exit -1
            fi
            HPREFIX=$OPTARG
            ;;
        \?)
            >&2 echo Unrecognized option: -$OPTARG
            exit -1
            ;;
        :)
            >&2 echo Option -$OPTARG requires an argument.
            exit -1
    esac
done

# Gather information for applying changes. Print report and get verification before applying.
if [[ -d $HPREFIX/.hconfig ]]; then
    >&2 echo Target directory $HPREFIX/.hconfig already exists. Not continuing.
    exit -1
fi
if [[ ! -d .git ]]; then
    >&2 echo No .git directory found in CWD.
    exit -1
fi

echo This will setup config framework in $HPREFIX using $(pwd).

echo -n "Proceed? [Y/n] "
read DOIT
if [[ ! ( $DOIT == [yY] || $DOIT == '' ) ]]; then
    echo Aborting Home-Config bootstrap.
    exit 0
fi

# Emplace files.
statline "Repository rsync"
rsync -av .git/ $HPREFIX/.hconfig

statline "Home directory rsync"
rsync -bav --suffix=.hcbak --exclude=.git --exclude=bootstrap --exclude=bin . $HPREFIX

# Don't want to show untracked files (the rest of the home directory).
hconfig="git --git-dir=$HPREFIX/.hconfig --work-tree=$HPREFIX"
$hconfig config --local status.showUntrackedFiles no

if [[ ! $HPREFIX == ~ ]]; then
    statline NOTE
    echo The hconfig alias in $HPREFIX/.bashrc will be incorrect since $HPREFIX is not the current user home directory.
fi

statline "Home-Config bootstrap complete."
