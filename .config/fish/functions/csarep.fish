function csarep -d 'Search and replace using cgrep.'
    cgrep -l $argv[1] | xargs sed -E -e "s/$argv[1]/$argv[2]/" -i ''
end
