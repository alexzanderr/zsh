
BOLD=$(tput bold)
GREEN="\033[0;32m"
RED='\033[0;31m'
reset_color='\033[0m'
WHITE='\033[1;37m'
YELLOW="\033[1;33m"

echo -e "\nthis $YELLOW/etc/zsh/zshenv$reset_color is run before anything in zsh\n"

export XDG_CONFIG_HOME="$HOME/.config"
echo -e "$YELLOW- XDG_CONFIG_HOME$reset_color: $XDG_CONFIG_HOME"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
echo -e "$YELLOW- ZDOTDIR$reset_color: $ZDOTDIR\n"


