# BASH completion

[ -f /etc/bash_completion ] && source /etc/bash_completion

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If npm is available, add its completion
if command -v "npm" &> /dev/null 2>&1; then
        # See npm -l for command usage
        source <(npm completion)
fi

if command -v "brew" &> /dev/null 2>&1; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        source $(brew --prefix)/etc/bash_completion
    fi
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g
fi
