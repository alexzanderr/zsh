
# if [[ $UID == 0 || $EUID == 0 ]]; then
#     # root
#     #
#     echo "zsh is run as ROOT"
#     # export ZDOTDIR="$ZDOTDIR_ROOT"
# else
#     echo "zsh is run as USER"
#     # export ZDOTDIR="$ZDOTDIR_HOME"
# fi

# vezi ca e un fisier important /etc/zsh/zshenv si zprofile

# ZDOTDIR is configured in /etc/zsh/zshenv
export ZPLUG_HOME="$ZDOTDIR/.zplug"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


BOLD=$(tput bold)
GREEN="\033[0;32m"
RED='\033[0;31m'
ENDC='\033[0m'
WHITE='\033[1;37m'
YELLOW="\033[1;33m"

function green () {
    printf "${GREEN}${BOLD}$1${ENDC}\n"
}

_set_i_beam_cursor() {
    # its used because nvim changes
    # the cursor to block everytime
    # and you must change it back manually
    echo -ne '\033[6 q'
}

preexec() {
    # last_command=$1
    # python3 $ZDOTDIR/zsh_python_scripts/preexec_handler.py "$last_command"
}

precmd_functions+=(_set_i_beam_cursor)


# terminal colors
export TERM="xterm-256color"

# SOURCES BEGIN
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zplug init
source $ZPLUG_HOME/init.zsh
# docs
# https://github.com/zsh-users/zsh-autosuggestions
# SOURCES END


# deci daca vrei tematica pusa manual trebuie sa-i dai source

# source ~/.oh-my-zsh/themes/passion.zsh-theme

# other good themes
# https://github.com/badouralix/oh-my-via
# https://github.com/win0err/aphrodite-terminal-theme
# https://github.com/skylerlee/zeta-zsh-theme
# https://github.com/kimwz/kimwz-oh-my-zsh-theme

source $ZDOTDIR/alexzander-custom.zsh-theme
echo -e "$terminfo[bold]$fg[green] (MATRIX) RELOADED$reset_color"
# source $ZDOTDIR/git-prompt.zsh-theme
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# zplug BEGIN
# zplug "eendroroy/alien"
zplug "zsh-users/zsh-syntax-highlighting"

# https://github.com/jhawthorn/fzy
# for this you need
# sudo pacman -S fzy
# sudo apt install fzy
zplug "aperezdc/zsh-fzy"


# zplug "ChesterYue/ohmyzsh-theme-passion"
# zplug "changyuheng/fz", defer:1
# zplug "rupa/z", use:z.sh

# installing plugins without prompt but not silently
if ! zplug check --verbose; then
    echo -e "Installing missing plugins..."
    zplug install
fi
zplug load --verbose

# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
# Then, source plugins and add commands to $PATH
# zplug END



# zsh autosuggest settings
# more colors
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#77803e,bg=bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c6c6c,bg=bold"




# if you want to edit these
# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/docs/highlighters

# zsh syntax highlighting settings
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)


# brackets highlithing settings
# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=green,bold'

ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=black,bg=green,bold'

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# more styles
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta,bold'

# aliases
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=yellowbold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=yellowbold'

ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,bold'

ZSH_HIGHLIGHT_STYLES[path]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow,bold'

ZSH_HIGHLIGHT_STYLES[function]='fg=magenta,bold'


ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green,bold'

ZSH_HIGHLIGHT_STYLES[assign]='fg=red,bold'

ZSH_HIGHLIGHT_STYLES[redirection]='fg=yellow,bold'

ZSH_HIGHLIGHT_STYLES[comment]='fg=green,bold'


# Declare the variable
typeset -A ZSH_HIGHLIGHT_PATTERNS

# To have commands starting with `rm -rf` in red:
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')


ZSH_HIGHLIGHT_STYLES[root]='bg=red'







# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# powerline theme
# https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
# ZSH_THEME="powerline"
#
# # powerline theme configurations
# POWERLINE_RIGHT_A="date"
# # POWERLINE_RIGHT_A+="exit-status"
# # POWERLINE_RIGHT_B="none"
# # POWERLINE_RIGHT_A="mixed"
# # POWERLINE_DATE_FORMAT="%D"
#
#
# POWERLINE_RIGHT_A_COLOR_FRONT="black"
# POWERLINE_RIGHT_A_COLOR_BACK="red"
# #
# # POWERLINE_HIDE_USER_NAME="false"
# # POWERLINE_HIDE_HOST_NAME="false"
# #
# # POWERLINE_DISABLE_RPROMPT="false"
# POWERLINE_NO_BLANK_LINE="true"
#
# POWERLINE_PATH="short"
#
# POWERLINE_DETECT_SSH="true"

#
# POWERLINE_GIT_CLEAN="✔"
# POWERLINE_GIT_DIRTY="✘"
# POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
# POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
# POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
# POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
# POWERLINE_GIT_RENAMED="➜"
# POWERLINE_GIT_UNMERGED="═"




# in order to restart zshell with .zshrc
# run this: ". ~/.zshrc"




# aliases
alias pydir="cd ~/Alexzander__/programming/python3"
alias c="clear"
alias s="sudo"
alias LS="ls"
alias con="cd ~/.config"
alias auto="cd ~/.conig/autostart"
alias e="exit"
alias rn="ranger"
alias rcon="cd ~/.config/ranger"
alias pac="pacman"
alias pam="pamac"
alias wi="which"
alias code="~/Applications__/VSCode-linux-x64/bin/code"
alias code_path="printf \"~/Applications__/VSCode-linux-x64/bin/code\n\""
alias th="thunar"
alias e="exit"
alias scode="cd ~/.config/Code/User"
alias vscode="cd ~/.vscode"
alias neo="neofetch"
alias term="cd .config/xfce4/terminal/"
alias q="exit"
alias tt="touch"
alias ipa="ip a"
alias ipr="ip r"

# nvim aliases
alias nv="nvim -u /home/alexzander/.config/nvim/init.vim"
alias nv_con="cd ~/.config/nvim"

# ranger aliases conf
alias ranger_con="cd ~/.config/ranger"


alias ala_con="cd ~/.config/alacritty"
alias zs="zsh"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# git python zsh_reload were already existent in the system
# dogsay needs be installed manually
# git clone https://github.com/txstc55/dogesay ~/.oh-my-zsh/plugins/dogesay

# plugins=(git python zsh_reload dogesay)

plugins=(git python zsh_reload virtualenv)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# reload zsh config without closing zsh
alias r="src"
alias R="src"
alias reload="src"
alias RELOAD="src"


# zsh version of
# stty werase \^H # control + backspace to delete previous word
# stty kill 23 # control + w to delete entire line to left
bindkey '^H' backward-kill-word
bindkey '^W' backward-kill-line
bindkey '^X' kill-whole-line
# bindkey '^X' vi-yank-whole-line



# alien powerline theme plugin
# https://github.com/eendroroy/alien/blob/master/alien.zsh-theme
# export ALIEN_SECTIONS_LEFT=(
#     battery
#     user
#     path
#     vcs_branch:async if you want to be loaded async
#     vcs_status:async se incarca mai greu daca e asa
#     vcs_dirty:async ca trebuie sa dea await si tu intre timp poti sa faci ceva pana is da load
#     newline
#     ssh
#     venv
#     prompt
# )
function get_cpu_temperature () {
    integer cpu_temp="$(</sys/devices/virtual/thermal/thermal_zone0/temp) / 1000"
    echo $cpu_temp
}

# acum se incarca instant
export ALIEN_SECTIONS_LEFT=(
    # user
    path
    vcs_branch:async
    vcs_status:async
    vcs_dirty:async
    newline
    ssh
    venv
    prompt
)


export ALIEN_SECTIONS_RIGHT=(
    # exit
    # time
    # battery
)
# export ALIEN_SECTIONS_LEFT_SEP_SYM=
# export ALIEN_SECTIONS_RIGHT_SEP_SYM=


# pentru culori
# https://jonasjacek.github.io/colors/


export ALIEN_SECTION_TIME_FORMAT='%H:%M:%S - %d.%m.%Y' # default is %r


# exit code colors
# foreground success
export ALIEN_SECTION_EXIT_FG=235
# background success
export ALIEN_SECTION_EXIT_BG=10
# background error
export ALIEN_SECTION_EXIT_BG_ERROR=9


# date and time colors
# foreground
export ALIEN_SECTION_TIME_FG=252
# background
export ALIEN_SECTION_TIME_BG=234


# battery colors
# foreground
# export ALIEN_SECTION_BATTERY_FG=155
export ALIEN_SECTION_BATTERY_FG=3
# background
export ALIEN_SECTION_BATTERY_BG=236



# show machine name after use with @
export ALIEN_SECTION_USER_HOST=1


# user and machine colors
# foreground
# lime green
export ALIEN_SECTION_USER_FG=156
# background
# gray deschis
export ALIEN_SECTION_USER_BG=235


# path colors
# foreground
# red inchis
# export ALIEN_SECTION_PATH_FG=9
export ALIEN_SECTION_PATH_FG=227
# background
# gray inchis
# export ALIEN_SECTION_PATH_BG=236
export ALIEN_SECTION_PATH_BG=236


# git branch colors
# foreground
# blue deschis
export ALIEN_SECTION_VCS_BRANCH_FG=153
# background
# gray deschis
export ALIEN_SECTION_VCS_BRANCH_BG=238


# git status
# insertions, deletions
# foreground
# gray inchis
export ALIEN_SECTION_VCS_STATUS_FG=234
# background
# red deschis
export ALIEN_SECTION_VCS_STATUS_BG=9


# git dirty (meaning that there are files modified but not commited to the branch)
# foreground
# gray inchis
export ALIEN_SECTION_VCS_DIRTY_FG=220
# background
# gray foarte deschis
export ALIEN_SECTION_VCS_DIRTY_BG=250

# symbol after prompt before cursor
# its foreground
# export ALIEN_PROMPT_FG=156
export ALIEN_PROMPT_FG=9
# its symbol
export ALIEN_PROMPT_SYM=']}>>>   '
# export ALIEN_PROMPT_SYM="\ue0d2  "
# export ALIEN_PROMPT_SYM="\ue0b0  "
# export ALIEN_PROMPT_SYM="\u276F  "

export ALIEN_VERSIONS_PROMPT='PYTHON_S NODE_S'



# export ALIEN_THEME="red"
export ALIEN_THEME="gruvbox"

# ALIEN_SECTION_SSH_FG=238
# ALIEN_SECTION_VENV_FG=238

# ALIEN_GIT_TRACKED_COLOR=193
# ALIEN_GIT_UN_TRACKED_COLOR=87

# ALIEN_SECTION_VERSION_BG=237
# ALIEN_PYTHON_COLOR=40
# ALIEN_RUBY_COLOR=196
# ALIEN_JAVA_COLOR=178
# ALIEN_GO_COLOR=81
# ALIEN_ELIXIR_COLOR=99
# ALIEN_CRYSTAL_COLOR=8
# ALIEN_NODE_COLOR=41
# ALIEN_PHP_COLOR=57


export ALIEN_GIT_STASH_SYM=@
export ALIEN_GIT_SYM=G
export ALIEN_HG_SYM=H
export ALIEN_SVN_SYM=S
export ALIEN_BRANCH_SYM=
export ALIEN_GIT_ADD_SYM=+
export ALIEN_GIT_DEL_SYM=-
export ALIEN_GIT_MOD_SYM=⭑
export ALIEN_GIT_NEW_SYM=?
export ALIEN_GIT_PUSH_SYM=↑
export ALIEN_GIT_PULL_SYM=↓
export ALIEN_JAVA_SYM='JAVA:'
export ALIEN_PY_SYM='PY:'
export ALIEN_RB_SYM='RB:'
export ALIEN_GO_SYM='GO:'
export ALIEN_ELIXIR_SYM='EX:'
export ALIEN_CRYSTAL_SYM='CR:'
export ALIEN_NODE_SYM='⬡ '
export ALIEN_PHP_SYM='PHP:'


# doge say words
declare -a WOWARR=("YOUR" "OWN" "WORDS" "ALEXZANDER" "ANDREW")

# doge dont say
declare -a NODOGE=("DOGE" "IGNORE" "THOSE" "COMMANDS")\


# zstyle :fzy:tmux    enabled      no
#
# zstyle :fzy:history show-scores  no
# zstyle :fzy:history lines        ''
# zstyle :fzy:history prompt       'find in history ==>> '
# zstyle :fzy:history command      fzy-history-widget
#
# zstyle :fzy:file    show-scores  no
# zstyle :fzy:file    lines        ''
# zstyle :fzy:file    prompt       'find files ==>> '
# zstyle :fzy:file    command      fzy-file-widget
#
# zstyle :fzy:cd      show-scores  no
# zstyle :fzy:cd      lines        ''
# zstyle :fzy:cd      prompt       'change to this folder ==>> '
# zstyle :fzy:cd      command      fzy-cd-widget
#
# zstyle :fzy:proc    show-scores  no
# zstyle :fzy:proc    lines        ''
# zstyle :fzy:proc    prompt       'find processes ==>> '
# zstyle :fzy:proc    command      fzy-proc-widget
#


# fzy plugin settings
bindkey '^F' fzy-file-widget
bindkey '^A' fzy-cd-widget
bindkey '^T' fzy-history-widget
bindkey '^P' fzy-proc-widget


BOLD=$(tput bold)
GREEN="\033[0;32m"
RED='\033[0;31m'
ENDC='\033[0m'
WHITE='\033[1;37m'
YELLOW="\033[1;33m"


function green () {
    printf "${GREEN}${BOLD}$1${ENDC}\n"
}

function red () {
    printf "${RED}${BOLD}$1${ENDC}\n"
}

function cancel_message () {
    red "[enter another command to cancel infinite opening]"
    printf "[control+C] ${RED}${BOLD}doesnt work${ENDC}\n"
    printf "[<enter>] ${RED}${BOLD}doesnt work${ENDC}\n"
}


# neofetch
# function prompt_function () {
#     echo "salut"
#     cwd=${PWD##*/}
# 	if [[ $cwd = "alexzander" ]]; then
# 		echo -ne "\033]0;~\007"
# 	else
# 		echo -ne "\033]0;${cwd}\007"
# 	fi
#
#     xdg-open "$history[$HISTCMD]" & # this takes last user inputed
#
# 	# strip the left and right spaces
# 	last_command=$(python3 ~/.strip_bash_command.py "$last_command")
# 	echo "|$last_command|"
#
# 	# contine spatii si sunt comenzi spre exemplu
# 	# git clone https://some_url.git
# 	# aici trebuie sa iasa pentru ca nu are voie sa deschida
# 	if [[ $last_command =~ " " ]]; then
# 		# echo "am iesit 2"
# 		return 1
# 	fi
#
# 	if [[ $last_command =~ "fc -ln -0" ]]; then
# 		echo "am iesit"
# 		return 1
# 	fi
#
# 	url_regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
#     if [[ $last_command =~ $url_regex ]]; then
#
#         # check if contains whitespaces
#         case "$last_command" in *\ * )
#             # printf "\n\n${YELLOW}$last_command${ENDC}\nhas spaces -> invalid (detected valid URL, but cant open)\n"
#             return 1
#             ;;
#         esac
#
#         {
#             url_open="xdg-open $last_command &"
#             eval $url_open
#         } &> /dev/null
#
#         green_result=$(green $last_command)
#         printf "\nvalid URL\n$green_result\nopened in default browser\n\n"
#         cancel_message
#
#     else
#         process_result=$(python3 ~/.check_path.py $last_command)
#         if [[ "$process_result" = "True" ]]; then
#             process="xdg-open $last_command &"
#             eval $process
#
#             green_result=$(green $last_command)
#             printf "\nvalid PATH\n$green_result\nopened in default file explorer\n\n"
#             cancel_message
#         fi
#     fi
#
#
# 	# https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
# 	# scroll-cursor at the middle of page
#
# 	# documentation to use control codes in order to change the cursor
#
# 	# CSI Ps SP q
# 	# 		Set cursor style (DECSCUSR), VT520.
# 	# 			Ps = 0  ⇒  blinking block.
# 	# 			Ps = 1  ⇒  blinking block (default).
# 	# 			Ps = 2  ⇒  steady block.
# 	# 			Ps = 3  ⇒  blinking underline.
# 	# 			Ps = 4  ⇒  steady underline.
# 	# 			Ps = 5  ⇒  blinking bar, xterm.
# 	# 			Ps = 6  ⇒  steady bar, xterm.
#
# 	# change cursor to i-beam (because nvim modifies everytime)
# 	#printf '\033[6 q' # steady i-beam
# 	printf '\033[4 q' # steady underline
# }

# function prompt_function () {
#     # printf '\033[4 q' # change cursor to underline
# }
#
# PROMPT_COMMAND=prompt_function
# precmd() {
#     eval "$PROMPT_COMMAND"
# }



#alias tr="tmux source-file ~/.tmux.conf"

alias img="ristretto"
alias pacman_search="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"

alias aur_search="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

alias lsd="ls -l | grep '^d'"

# git aliases
alias gi="git init"
alias ga="git add ."
alias gc="git commit -m"
alias gs="git status"
alias gl="git log"
alias gp="git push -f origin master"
alias gfp="git ftp push"
alias gfpp="git push -f origin master && echo -e '\n--------------\n' && git ftp push"

# mercurial aliases
alias mi="hg init"
alias ma="hg add ."
alias mc="hg commit -m"
alias ms="hg status"
alias ml="hg log"
alias mp="hg push"

alias tree="tree -I '.git' -a"
alias tre="tree -I '.git' -a"
# alias tree="tree -a -h"
alias t="tmux"


alias la="ls -a"
alias his="history"

alias lsv="live-server ."
alias cpc="xclip -sel c < "

alias sw="stow --adopt --verbose=2 -t ~"
alias catn="cat -n"
alias pt="lsblk"
alias size="du -sh"
alias siz="du -sh"
alias ca="cat"
alias gu="ga && gc 'done' && gp"

# bindkey "^[[1~" beginning-of-line
# bindkey "^[[4~" end-of-line
#
# bindkey "\E[H" beginning-of-line
# bindkey "\E[F" end-of-line
# bindkey "\E[3~" delete-char


# check out for this
# https://github.com/calebmeyer/cpm-zsh-theme/blob/master/cpm.zsh-theme#L38

# improve performance of zsh
# https://htr3n.github.io/2018/07/faster-zsh/#optimising-shell-prompts


# to run this you must have in .profile the core project path
title=$(python3 $ZDOTDIR/zsh_python_scripts/print_title.py)
echo $title | lolcat

if [[ $UID == 0 || $EUID == 0 ]]; then
    echo -e "                                             $terminfo[bold]$fg[white][ ROOT MODE ]$reset_color"

fi


gray_colon="$terminfo[bold]$fg[black]:$reset_color"

echo -e "\n$fg[yellow]ZDOTDIR$reset_color$gray_colon $terminfo[bold]$fg[white]$ZDOTDIR$reset_color"
echo -e "$fg[yellow]zshrc$reset_color$gray_colon $ZDOTDIR$fg[green]/.zshrc$reset_color"
echo -e "$fg[yellow]oh-my-zsh$reset_color$gray_colon $ZDOTDIR$fg[green]/.oh-my-zsh"
echo -e "$fg[yellow]zplug$reset_color$gray_colon $ZDOTDIR$fg[green]/.zplug"
echo -e "$fg[yellow]prompt-theme$reset_color$gray_colon $ZDOTDIR$fg[green]/alexzander-custom.zsh-theme"



# zsh is updated constantly from atom

# exportam o singura data o variabila globala
# if [[ $SSH_CONNECTION ]]; then
#     echo -e "export SSH_GLOBAL='$SSH_CONNECTION'" >> /etc/zsh/zshenv
# else
#     if [[ $SSH_GLOBAL ]]; then
#         unset SSH_GLOBAL
#         sed -i '$ d' /etc/zsh/zshenv
#     fi
# fi