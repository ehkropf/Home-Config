# Defined in /var/folders/j4/5p46q3ln1659bsxf2q_gm39m0000gn/T//fish.MzK4e1/cgrep.fish @ line 2
function cgrep --description 'Grep in c/c++ files.'
	find -E . -regex ".*\.(c|h|cpp|hpp)" | xargs command grep --color=auto $argv;
end
