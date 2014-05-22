# internal functions for use in cheat sheets below
chcolor () {
    echo -n "$ORANGE$1$RESET"
    echo -e "$2"
}
chtitle () {
    echo -e "$PURPLE\t\t$1\n$RESET"
}

# Misc tips from above link
cheatmoar () {
    chtitle "more bash tricks"
    chcolor '^+R' "\t\t-> reverse search through history"
    chcolor 'Quick Copy' "\t-> cp /home/foo/realllylongname.cpp{,-old}\n\t\tExpands to:\n\t\tcp /home/foo/realllylongname.cpp /home/foo/realllylongname.cpp-old"
    chcolor '^str^str2' "\t-> replaces str in the last cmd with str2 & executes it"
    echo -en "$ORANGE"; echo -en '! tricks '; echo -en "$RESET\t-> the "; echo -e '!$, !^ & !* expandos return, from the most recent line:\n\t\tthe last item, first argument item, & all arguments'
    echo -en "$ORANGE"; echo -en 'cmd !!:$N '; echo -e "$RESET\t-> run cmd with the previous ones' arguments\n\t\tuses Nth arg, or 1st ($), or last (^), or range (e.g. \$-3)"
    chcolor 'ESC .' "\t\t-> insert last arguments from last cmd"
    chcolor 'Alt-$N, Alt-Ctrl-Y' " -> insert Nth argument from last cmd"
    chcolor '\cmd' "\t\t-> do not use the alias for 'cmd'"
    echo -en "$ORANGE"; echo -en '!?foo?:p '; echo -en "$RESET\t-> search for last cmd containing 'foo,' "; echo -e '!?foo executes'
    echo
}

# Print cheat sheet of dotfiles functions/aliases
cheat () {
    chtitle "bash cheatsheet"
    chcolor 'c' "\t\t-> trim new lines & copy to clipboard"
    chcolor '^+A' "\t\t-> jump to beginning of line"
    chcolor '^+E' "\t\t-> jump to end of line"
    chcolor '^+K' "\t\t-> delete to end of line"
    chcolor '^+U' "\t\t-> delete to beginning of line"
    chcolor '^+W' "\t\t-> delete word next to cursor"
    chcolor 'dataurl' "\t\t-> make data URL from file"
    chcolor 'gi' "\t\t-> install Grunt plugin, e.g. 'gi contrib-uglify'"
    chcolor 'gurl' "\t\t-> Gzip-enabled curl"
    chcolor 'lsof -i' "\t\t-> View programs with open ports & connections"
    chcolor 'mdfind' "\t\t-> Search Spotlight index"
    chcolor 'oo' "\t\t-> open current directory"
    chcolor 'spot(off|on)' "\t-> turn Spotlight off & on"
    chcolor 'tar -zxvf $FILE' "\t-> unzip tar ball"
    chcolor 'urlencode' "\t-> URL encode string"
    echo
}

# Git cheats
gcheat () {
    chtitle "git cheatsheet"
    chcolor 'g a -p' "\t\t\t-> stage piecemeal 'hunks' of a file"
    chcolor 'g d' "\t\t\t-> diff between latest commit & current state"
    chcolor 'g di $N' "\t\t\t-> diff betw N commits ago & current state"
    chcolor 'g go X' "\t\t\t-> goto branch X, create if doesn't exist"
    chcolor 'g reset $HASH' "\t\t-> revert to commit HASH but keep changes in working dir\n\t\t\tadd --hard flag to erase changes"
    chcolor 'g checkout -- <file>' "\t-> unstage changes to <file>"
    chcolor 'g push origin $BRANCH' "\t-> push BRANCH to GitHub (remote)"
    chcolor 'g log -p' "\t\t-> see diffs of changed files in log"
    echo
}

# Sublime Text cheats
scheat () {
    chtitle "sublime text shortcuts"
    # taken from gist.github.com//lucasfais/1207002
    chcolor '⌘ T' '\t-> go to file'
    chcolor '⌘ ⌃ P' '\t-> go to project'
    chcolor '⌘ R' '\t-> go to methods'
    chcolor '⌃ G' '\t-> go to line'
    chcolor '⌘ KB' '\t-> toggle side bar'
    chcolor '⌃ ⇧ M' '\t-> select content into brackets'
    chcolor '⌘ ⇧ ↩' '\t-> insert line before'
    chcolor '⌘ ↩' '\t-> insert line after'
    chcolor '⌃ ⇧ K' '\t-> delete line'
    chcolor '⌘ KK' '\t-> delete from cursor to end of line'
    chcolor '⌘ K ⌫' '\t-> delete from cursor to start of line'
    chcolor '⌘ ⇧ D' '\t-> duplicate line(s)'
    chcolor '⌘ J' '\t-> join lines'
    chcolor '⌘ KU' '\t-> upper case'
    chcolor '⌘ KL' '\t-> lower case'
    chcolor '⌘ ⌥ /' '\t-> block comment'
    chcolor '⌘ ⇧ V' '\t-> paste & indent'
    chcolor '⌃ space' '\t-> autocomplete (repeat to select next suggestion)'
    chcolor '⌃ M' '\t-> jump to matching brackets'
    chcolor '⌘ U' '\t-> soft undo (movement undo)'
    chcolor '⌘ ⇧ U' '\t-> soft redo (movement redo)'
    chcolor '⌘ ⌥ .' '\t-> close XML/HTML tag'
    chcolor '⌘ ⇧ F' '\t-> find in files'
    chcolor '⌘ ⌥ N' '\t-> N columns (use 1 to return to single)'
    chcolor '⌘ ⌥ 5' '\t-> grid (4 groups)'
    chcolor 'fn F5' '\t-> order CSS properties alphabetically'
}
