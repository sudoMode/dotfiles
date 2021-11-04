# custom aliases

# shell
alias c=clear

# python
alias j="jupyter"
alias jn="j notebook"
alias jdark="\
                jt -t gruvboxd -T -N -kl -vim -f source -fs 11 -nf roboto -nfs 11  -tf 
                robotosans -tfs 12 -dfs 9 -ofs 9 -cursc b -cursw 3 -cellw 74%"



# custom functions
# activate virtual environments
function activate
    source ~/dev/environments/$argv/bin/activate.fish
end

# configure anybar
# anybar red
# anybar black 1739
function anybar
    echo -n $1 | nc -4u -w0 localhost $2:-1738
end



funcsave activate
funcsave anybar


# neofetch
neofetch
