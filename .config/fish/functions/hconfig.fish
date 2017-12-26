function hconfig --wraps=/usr/bin/git
    /usr/bin/git --git-dir=$HOME/.hconfig --work-tree=$HOME $argv
end
