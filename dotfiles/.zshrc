# Colors
RED='\033[0;31m'
NC='\033[0m' # No Color

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt walters

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

function set-title(){
  echo -e "\033];$*\007"
}

export LC_TIME=en_DK.UTF-8

# Zsh vi mode normal/insert indicator
bindkey -v # Start vi mode
export KEYTIMEOUT=1 # Fix lag between mode switch
bindkey "^?" backward-delete-char # Fix backspace acting weird
bindkey '^R' history-incremental-search-backward

# Don't close less when reaching bottom (remove e flag)
export LESS=dMqifR

# Shorter key repeat delay and faster repeat rate
xset r rate 200 40

# # Finds the directory that the script is located in
# DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )
# # Source private script that is not pushed to Github (i.e. company specific script)
# [ -f $DIR/.privaterc ] && source $DIR/.privaterc

alias c='cd ..'
alias gk='gitk --all &'
alias gittrack='git branch --set-upstream-to='
alias devmod='devtool modify -w'
alias devres='devtool reset'
alias devstat='devtool status'
alias agorig='\ag -Uf --color'
alias ag='echo "${RED}WARNING: Skipping files in oe-*/, tmp/, sysroot*/, snapshots/\nUse \"agorig\" to search all files\n${NC}" && \ag -Uf --color --ignore "oe-*" --ignore "tags" --ignore "tmp" --ignore "sysroot*" --ignore "snapshots" --ignore "bitbake-cookerdaemon.log"'
alias gpr='git pull --rebase'
alias f='find . -name'
alias sizes='du -hs *'
alias l='ls -alh --color'
alias ll='ls -lh'
alias finder='xdg-open .'
alias vim='~/apps/nvim.appimage 2>/dev/null || nvim'
alias v='vim'
alias cspy="find . -name '*.py' > cscope.files && cscope -Rb"
alias zshrc='vim $HOME/scripts/toolbox/.zshrc && source $HOME/scripts/toolbox/.zshrc'
alias privaterc='vim $HOME/scripts/toolbox/.privaterc && source $HOME/scripts/toolbox/.privaterc'
alias oe-find='oe-pkgdata-util find-path'
alias am='git-am patches/'
alias tagup='ctags -R --exclude="oe-*" .'
alias usbs='ls -alh /dev/ttyUSB* && ls -alh /dev/usblog*'
bbake () { bitbake "$1" ; notify-send "Bitbake" "$1 build complete!" }
bclean () { bitbake -c cleansstate "$1" ; notify-send "Bitbake" "$1 clean complete!" }
alias poweroff="echo \"You don't want to do this\""
alias shutdown="echo \"You don't want to do this\""
alias reboot="echo \"You don't want to do this\""
highlight () { grep --color=always -e "^" -e "$1"; }

# fzf, fuzzy search in shell
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

chromatic_zsh="$HOME/scripts/toolbox/chromatic-zsh/chromatic-zsh.zsh"
[ -f $chromatic_zsh ] && source $chromatic_zsh

# Start Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
