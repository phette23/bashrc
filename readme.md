# Bash Configuration

Bash shell customizations, such as handy aliases & functions.

This project breaks off of [my previous dotfiles](https://github.com/phette23/my-dotfiles/) repo which in turn owes great debts to Mathias Bynens' excellent [dotfiles repo](https://github.com/mathiasbynens/dotfiles). The configuration files from that repo are in [a separate project](https://github.com/phette23/dotconfig) now.

## Structure

Everything is sourced through .bash_profile; .bashrc just sources .bash_profile. The files inside "inc" have self-explanatory names, like "path" and "aliases".

## Grunt Tasks

If you have Node & Grunt installed, you can run `npm i` inside this project to get started.

**`grunt copy`** (also the default `grunt`) moves the files into place.

**`grunt watch`** monitors inc/, .bashrc, & .bash_profile for changes & then runs `copy`.