# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# Check if brew is defined, run Homebrew-specific commands
if command -v "brew" &> /dev/null 2>&1; then
    # Z from Homebrew
    source $(brew --prefix)/etc/profile.d/z.sh
fi

# Show current dir name (not full path) in iTerm tab title
# but only if PROMPT_COMMAND doesn't already do so
# prevents login-shell-with-a-login-shell problems (e.g. tmux)
if [ $ITERM_SESSION_ID ] && [ ! "$(echo $PROMPT_COMMAND | egrep 'echo -ne "\\033\];')" ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# OS X Aliases

# use iTerm-Tmux integration if we're in iTerm
# see: https://code.google.com/p/iterm2/wiki/TmuxIntegration
if [ $ITERM_SESSION_ID ]; then
    alias tm='tmux -CC'
fi

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
[ -e "${jscbin}" ] && alias jsc="${jscbin}"
unset jscbin

# Source-Highlight (requires Homebrew package)
alias ccat='src-hilite-lesspipe.sh'

# Update OS X software, Ruby gems, Homebrew, global NPM packages
alias update='npm update -g; sudo softwareupdate -i -a; gem update --system && gem update; brew update && brew upgrade;'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# OS X Functions

# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
remind () {
  local text
  if [ -t 0 ]; then
    text="$1" # argument
  else
    text=$(cat) # pipe
  fi
  osascript >/dev/null <<EOF
tell application "Reminders"
  tell the default list
    make new reminder with properties {name:"$text"}
  end tell
end tell
EOF
}

# Add note to Notes.app (OS X 10.8)
# Usage: `note 'title' 'body'` or `echo 'body' | note`
# Title is optional
note () {
  local title
  local body
  if [ -t 0 ]; then
    title="$1"
    body="$2"
  else
    title=$(cat)
  fi
  osascript >/dev/null <<EOF
tell application "Notes"
  tell account "iCloud"
    tell folder "Notes"
      make new note with properties {name:"$title", body:"$title" & "<br><br>" & "$body"}
    end tell
  end tell
end tell
EOF
}

# tab $CMD opens a new tab & executes $CMD in it
# stolen from oh-my-zsh's OS X plugin:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/osx/osx.plugin.zsh
tab () {
  local command="clear"
  (( $# > 0 )) && command="$*"

  the_app=$(
    osascript 2>/dev/null <<EOF
      tell application "System Events"
        name of first item of (every process whose frontmost is true)
      end tell
EOF
  )

  [[ "$the_app" == 'Terminal' ]] && {
    osascript 2>/dev/null <<EOF
      tell application "System Events"
        tell process "Terminal" to keystroke "t" using command down
        tell application "Terminal" to do script "${command}" in front window
      end tell
EOF
  }

  [[ "$the_app" == 'iTerm' ]] && {
    osascript 2>/dev/null <<EOF
      tell application "iTerm"
        activate
        tell the first terminal
          launch session "Default Session"
          tell the last session
            write text "${command}"
          end tell
        end tell
      end tell
EOF
  }
}

backup () {
    if [ -d /Volumes/share ]; then
        local RFLAGS="-ahuz --progress"
        local DEST="/Volumes/share"
        # use separate excludes file
        rsync $RFLAGS --exclude-from ~/.inc/itunes-rsync-excludes.txt ~/Music ${DEST}/
        rsync $RFLAGS ~/Movies/ ${DEST}/Video/
        rsync $RFLAGS ~/Pictures/ ${DEST}/Images/
        rsync $RFLAGS ~/Documents/zzz/ ${DEST}/zzz/
        rsync $RFLAGS ~/Documents/OvalII.sparsebundle ${DEST}/OvalII.sparsebundle
        rsync $RFLAGS ~/Documents/nsn.dmg ${DEST}/nsn.dmg
        # run Spideroak backups w/o the GUI
        # & backup ~/Documents to Google Drive concurrently
        /Applications/SpiderOak.app/Contents/MacOS/SpiderOak --batchmode & \
            zip -rq documents.zip ~/Documents \
            && mv documents.zip ~/Google\ Drive/backups/
    else
        echo "Connect to backup drive first."
    fi
}
