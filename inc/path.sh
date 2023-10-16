#!/usr/bin/env bash
# add dir to path if it exists and isn't already there
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}
pathadd /usr/local/bin
pathadd /opt/Homebrew/bin
pathadd "$HOME"/bin
# Add Gnu utilities if we have them in Homebrew
if command -v brew &>/dev/null; then
    pathadd "$(brew --prefix coreutils)/libexec/gnubin:${PATH}"
fi
