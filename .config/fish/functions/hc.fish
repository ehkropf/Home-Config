# Defined in /var/folders/j4/5p46q3ln1659bsxf2q_gm39m0000gn/T//fish.umuGYJ/hc.fish @ line 2
function hc
	if test (count $argv) -eq 0
        hconfig status
    else if test $argv[1] = "log"
        hconfig log --graph --decorate $argv[2..-1]
    else
        hconfig $argv
    end
end
