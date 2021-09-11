# Defined in /Users/mandeepsingh/.config/fish/config.fish @ line 21
function anybar
    echo -n $1 | nc -4u -w0 localhost $2:-1738
end
