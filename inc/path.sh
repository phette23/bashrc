# 1) To make Homebrew work, put it at the front of the path
# so brew packages are used over Mac OS defaults (e.g. git)
# 2) global NPM packages (e.g. Grunt, Yeoman)
export PATH="/usr/local/bin:$(brew --prefix coreutils)/libexec/gnubin:/usr/local/share/npm/bin:/usr/local/pear/bin:${HOME}/bin:${PATH}"
