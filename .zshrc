

#  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
# | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
# | |   ________   | || |    _______   | || |  ____  ____  | || |  _______     | || |     ______   | |
# | |  |  __   _|  | || |   /  ___  |  | || | |_   ||   _| | || | |_   __ \    | || |   .' ___  |  | |
# | |  |_/  / /    | || |  |  (__ \_|  | || |   | |__| |   | || |   | |__) |   | || |  / .'   \_|  | |
# | |     .'.' _   | || |   '.___`-.   | || |   |  __  |   | || |   |  __ /    | || |  | |         | |
# | |   _/ /__/ |  | || |  |`\____) |  | || |  _| |  | |_  | || |  _| |  \ \_  | || |  \ `.___.'\  | |
# | |  |________|  | || |  |_______.'  | || | |____||____| | || | |____| |___| | || |   `._____.'  | |
# | |              | || |              | || |              | || |              | || |              | |
# | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
#  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#------------------------------------------------------------------------------------------
#  _____ _                           ____       _           _   _
# |_   _| |__   ___ _ __ ___   ___  / ___|  ___| | ___  ___| |_(_) ___  _ __
#   | | | '_ \ / _ \ '_ ` _ \ / _ \ \___ \ / _ \ |/ _ \/ __| __| |/ _ \| '_ \
#   | | | | | |  __/ | | | | |  __/  ___) |  __/ |  __/ (__| |_| | (_) | | | |
#   |_| |_| |_|\___|_| |_| |_|\___| |____/ \___|_|\___|\___|\__|_|\___/|_| |_|

current_terminal="$(ps -p$PPID -o cmd=)"

function choose_theme {
    if [[ $current_terminal =~ 'tilix' ||  $current_terminal =~ 'tmux' || $current_terminal =~ 'kitty' || $current_terminal =~ 'alacritty' ]];
    then echo 'lena2';
    else echo 'spaceship';
    # else echo 'bubblified';
    # else echo 'powerlevel10k/powerlevel10k';
    fi
}

ZSH_THEME="$(choose_theme)"


#------------------------------------------------------------------------------------------
#   ____                           _
#  / ___| ___ _ __   ___ _ __ __ _| |
# | |  _ / _ \ '_ \ / _ \ '__/ _` | |
# | |_| |  __/ | | |  __/ | | (_| | |
#  \____|\___|_| |_|\___|_|  \__,_|_|

# Set ranger to use local config
RANGER_LOAD_DEFAULT_RC="true"

# Auto complete aliases
setopt completealiases

# Enable colors
export CLICOLOR=1

# GPG key agent stuff
GPG_TTY=$(tty)
export GPG_TTY

# Colored prompt
autoload -U promptinit
promptinit

# Help to man page conversion
autoload -Uz run-help
unalias run-help
alias help=run-help

# Dont show Commands more than once
setopt HIST_IGNORE_DUPS

# History stuff
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

export HISTSIZE=500000
export SAVEHIST=500000


# User configuration
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=alacritty
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

export MANPATH="/usr/local/man:$MANPATH"

# Cursor
#echo -e -n "\x1b[\x30 q" # changes to blinking block
#echo -e -n "\x1b[\x31 q" # changes to blinking block also
#echo -e -n "\x1b[\x32 q" # changes to steady block
#echo -e -n "\x1b[\x33 q" # changes to blinking underline
echo -e -n "\x1b[\x34 q" # changes to steady underline
#echo -e -n "\x1b[\x35 q" # changes to blinking bar
#echo -e -n "\x1b[\x36 q" # changes to steady bar

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

# Find new executables in path
zstyle ':completion:*' rehash true

# This causes pasted URLs to be automatically escaped, without needing to disable globbing.
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Automatically open ls when changing directory
cdls() { cd "$@" && colorls; }

# Change ls to colorls
# ls() { colorls -A --sd;}

# Go back and forward one word
bindkey "^[b" backward-word
bindkey "^[f" forward-word

# Fix zle widgets error
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

# Adding zle modules so all modes can be displayed
zle -N zle-line-init
zle -N zle-keymap-select

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Bind ctrl r to inc search
bindkey "^r" history-incremental-search-backward


#------------------------------------------------------------------------------------------
#   ____  _             _
#  |  _ \| |_   _  __ _(_)_ __  ___
#  | |_) | | | | |/ _` | | '_ \/ __|
#  |  __/| | |_| | (_| | | | | \__ \
#  |_|   |_|\__,_|\__, |_|_| |_|___/
#                 |___/


plugins=(
vi-mode
git
zsh-autosuggestions
zsh-syntax-highlighting
sudo
#tmux
vscode
auto-color-ls
zsh-256color
history
colored-man-pages
command-not-found
pip
zshmarks
)


#------------------------------------------------------------------------------------------
#  __     _____      __  __           _
#  \ \   / /_ _|    |  \/  | ___   __| | ___
#   \ \ / / | |_____| |\/| |/ _ \ / _` |/ _ \
#    \ V /  | |_____| |  | | (_) | (_| |  __/
#     \_/  |___|    |_|  |_|\___/ \__,_|\___|
#


# Set vi mode
bindkey -v

# Set timeout to 0.1 sec
export KEYTIMEOUT=1

# Add mode indication to prompt
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    zle reset-prompt
}


#------------------------------------------------------------------------------------------
#     _    _ _
#    / \  | (_) __ _ ___  ___  ___
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/

alias up="sudo pacman -Syu && yay -Syu"
alias update="sudo pacman -Syu && yay -Syu"
alias install="sudo pacman -Syu"
alias remove="sudo pacman -Rns"
alias delete="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias class="xprop | grep CLASS"
alias snapshot="sudo timeshift --create"
alias cache="sudo pacman -Scc && sudo paccache -r"
alias yaycache="sudo rm -r ~/.cache/yay/*"
# alias search="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias search="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
alias orphan="sudo pacman -Rns \$(pacman -Qtdq)"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias neofetch="neofetch | lolcat -F 0.06 -p 377777 -S 50"
alias matrix="unimatrix"
alias audio="pulseaudio-equalizer-gtk"
alias scrot="scrot -e 'mv \$f /home/joe/Pictures/Screenshots'"
alias cowsay="cowsay -f satanic"
alias killtmux="tmux kill-session"
alias github="cd /home/joe/Github"
alias vim="nvim"
alias v="vim"
alias ..="cd .."
alias sudo="sudo -E"
alias restore="sudo timeshift --restore"
alias zsh="source ~/.zshrc"
alias br="broot"
alias b="jump"
alias bm="showmarks"
alias handy="scrcpy"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git pull"
alias gf="git fetch"
alias gp="git push -u origin master"


#------------------------------------------------------------------------------------------
#  ____                        _                _ _  ___  _
# |  _ \ _____      _____ _ __| | _____   _____| / |/ _ \| | __
# | |_) / _ \ \ /\ / / _ \ '__| |/ _ \ \ / / _ \ | | | | | |/ /
# |  __/ (_) \ V  V /  __/ |  | |  __/\ V /  __/ | | |_| |   <
# |_|   \___/ \_/\_/ \___|_|  |_|\___| \_/ \___|_|_|\___/|_|\_\

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( command_execution_time root_indicator background_jobs battery disk_usage ram)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=true
ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="002"

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="grey"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="grey"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="grey"

POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND="red"
POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND="black"

POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="002"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="red"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="black"

POWERLEVEL9K_USER_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_USER_SUDO_FOREGROUND="black"
POWERLEVEL9K_USER_ROOT_FOREGROUND="red"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="red"
POWERLEVEL9K_USER_SUDO_BACKGROUND="red"
POWERLEVEL9K_USER_ROOT_BACKGROUND="black"

POWERLEVEL9K_STATUS_ERROR_FOREGROUND="006"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="balck"
POWERLEVEL9K_STATUS_OK_FOREGROUND="006"
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"

POWERLEVEL9K_VCS_UNTRACKED_ICON="\u25CF"
POWERLEVEL9K_VCS_UNSTAGED_ICON="\u00b1"
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\u2193"
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\u2191"
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='blue'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='black'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='blue'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='black'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='blue'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='black'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='blue'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='black'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=''

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0BC "
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0BE "
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="\uE0BD "
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="\uE0BF "

POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uF09C"
POWERLEVEL9K_SUDO_ICON=$"\uF09C" # 
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_VCS_GIT_ICON="\uF408 "
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uF408 "
POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_RAM_ICON="\uF469"
POWERLEVEL9K_BATTERY_ICON="\uF583"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uE349 "


#------------------------------------------------------------------------------------------
#  _____ __________    ____             __ _
# |  ___|__  /  ___|  / ___|___  _ __  / _(_) __ _
# | |_    / /| |_    | |   / _ \| '_ \| |_| |/ _` |
# |  _|  / /_|  _|   | |__| (_) | | | |  _| | (_| |
# |_|   /____|_|      \____\___/|_| |_|_| |_|\__, |
#                                            |___/


export FZF_DEFAULT_COMMAND='fd --type f'
# Use fd
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}


# fasd & fzf change directory - jump using `fasd` if given argument, else filter output of
# `fasd` using `fzf`
_z() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}


# export FZF_DEFAULT_COMMAND="find -L"
# export FZF_DEFAULT_COMMAND="find  -L * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null"

# export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export FZF_DEFAULT_COMMAND="find . -type f -print -o -type l -print 2> /dev/null | sed s/^..//"


# Set fzf colorscheme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#00eeff,fg+:-1,bg+:-1,hl+:#00ff5f
--color=info:#af87ff,prompt:#00eeff,pointer:#cd1bfc,marker:#cd1bfc,spinner:#cd1bfc
--layout=reverse
'


#------------------------------------------------------------------------------------------
#  ____                       _
# / ___|  ___  _   _ _ __ ___(_)_ __   __ _
# \___ \ / _ \| | | | '__/ __| | '_ \ / _` |
#  ___) | (_) | |_| | | | (__| | | | | (_| |
# |____/ \___/ \__,_|_|  \___|_|_| |_|\__, |
#                                     |___/

# Enable ruby gems
path+=(
    $(ruby -e 'puts File.join(Gem.user_dir, "bin")')
)

# Load fusuma
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Source colors for colorls
eval $( dircolors -b $HOME/.dircolors )

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Load colorls into zsh
source $(dirname $(gem which colorls))/tab_complete.sh

# needs to be directly under sourcing to work
alias ls="colorls -A --sd"

# Source fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/share/fzf/key-bindings.zsh

source /usr/share/fzf/completion.zsh


export FZF_DEFAULT_OPS0"extended"

export PATH=$PATH:/usr/local/go/bin

export BAT_THEME="Nord"

export PATH=$PATH:/home/joe/.scripts/

export FZF_PREVIEW_PREVIEW_BAT_THEME="Nord"


# Autojump
[[ -s /home/joe/.autojump/etc/profile.d/autojump.sh ]] && source /home/joe/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


# Sorce syntax highlighting (needs to be sourced at the end of the file)
source /home/joe/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh



