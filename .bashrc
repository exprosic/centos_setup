# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
function generate_PS1 {
        BOLD='\[\e[01m\]'
        GREEN='\[\e[32m\]'
        YELLOW='\[\e[33m\]'
        BLUE='\[\e[34m\]'
        NORMAL='\[\e[0m\]'
        DIRS="$BLUE$(dirs -p\
                |sed 's@\\@\\&@g'\
                |sed -re ':1 N;s@^(.*)/?(.*)\n\1$@\1|\2@;s@(.*)\n(.*)@\2|\1@;b1'\
                |sed -e 's@|@'"${YELLOW//\\/\\\\}|${BLUE//\\/\\\\}"'@g')"

        PS1="$BOLD$GREEN"'\u@\h '"$DIRS"'\n'"$NORMAL"'$(eval printf \\\$%.0s {1..$SHLVL}; ((\j)) && printf _%.0s {1..\j}) '
}

export PROMPT_COMMAND='generate_PS1'

function silently { "$@"; } >/dev/null
alias pd='silently pushd'
alias po='silently popd'

function lgrep { grep --line-buffered --color=always "$@" | less -R; }

