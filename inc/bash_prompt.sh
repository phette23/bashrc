# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# Screenshot: http://i.imgur.com/s0Blh.png

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

parse_git_branch () {
	local branch
	local status
	branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if [ -n "${branch}" ]; then
		[ "${branch}" == "HEAD" ] && branch=$(git rev-parse --short HEAD 2>/dev/null)
		status=$(git status --porcelain 2>/dev/null)
		echo -n " on ${PURPLE}${BOLD}${branch}"
		[ -n "${status}" ] && echo -n "*"
	fi
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[${RESET}\]at \[${BOLD}${ORANGE}\]\h \[${RESET}\]in \[${BOLD}${GREEN}\]\w\[${RESET}\]\$(parse_git_branch)\[${RESET}${PURPLE}\]\n¿ \[${RESET}\]"
export PS2="\[${ORANGE}\]→ \[${RESET}\]"
