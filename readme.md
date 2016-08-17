# Bash Configuration

Bash shell customizations, such as handy aliases & functions.

This project breaks off of [my previous dotfiles](https://github.com/phette23/my-dotfiles/) repo which in turn owes great debts to Mathias Bynens' excellent [dotfiles repo](https://github.com/mathiasbynens/dotfiles). The configuration files from that repo are in [a separate project](https://github.com/phette23/dotconfig) now.

The included "copy.sh" script copies all the necessary files into place. It will overwrite your existing .bashrc and .bash_profile so back those up first if you want to keep them.

## Structure

Everything is sourced through .bash_profile; .bashrc just sources .bash_profile. The files inside "inc" have self-explanatory names, like "path" and "aliases".
