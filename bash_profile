if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# vim: set ft=sh:

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
