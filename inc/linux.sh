# Linux version of update command
alias upd='npmgup; sudo gem update; sudo apt-get update -qq && sudo apt-get upgrade -y;'

# Linux version of emptytrash
alias emptytrash='rm -rf ~/.local/share/Trash/files/*'

# Searching for packages is too verbose
alias aptfind='apt-cache search'

# for piping text to clipboard, requires xclip
alias clip='xclip -sel clip'

# Source-Highlight, requires the package in apt
alias ccat='/usr/share/source-highlight/src-hilite-lesspipe.sh'

# IP addresses
alias extip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# source Z from Linux install location
[ -f /usr/local/etc/z/z.sh ] && source /usr/local/etc/z/z.sh

# if we're in an SSH session, say so & which hostname
# else make title of terminal tab the current dir's name
if [ -n "$SSH_CLIENT" ]; then
    export PS1="\[\e]0;ssh on ${HOSTNAME}\a\]$PS1"
else
    export PS1="\[\e]0;\$(pwd | tr '/' '\n' | tail -n1)\a\]$PS1"
fi
