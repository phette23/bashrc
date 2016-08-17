# 1) To make Homebrew work, put it at the front of the path
# so brew packages are used over Mac OS defaults (e.g. git)
# 2) global NPM packages (e.g. Grunt, Yeoman)
export PATH="/usr/local/bin:/usr/local/pear/bin:${HOME}/bin:${PATH}"
# Add Gnu utilities if we have them in Homebrew
if command -v brew &>/dev/null; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:${PATH}"
fi
