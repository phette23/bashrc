# load all the other shell customizations
# import for path & functions to go first, order of rest doesn't matter
for file in ~/.inc/{path,functions,aliases,bash_prompt,completion,exports}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# source OS-specific stuff
[[ $(uname) == "Darwin" ]] && [ -f ~/.inc/mac.sh ] && source ~/.inc/mac.sh
[[ $(uname) == "Linux" ]] && [ -f ~/.inc/linux.sh ] &&  source ~/.inc/linux.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# initialize rbenv
exists rbenv && eval "$(rbenv init -)"
