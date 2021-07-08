
# Based on the great ys theme (http://ysmood.org/wp/2013/03/my-ys-terminal-theme/)


# TODO
# read this https://github.com/johan/zsh/blob/master/Misc/vcs_info-examples

# also see this gist https://gist.github.com/mika/e30b4e99c338f5d80d7681407708609b

# git prompt configuration
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
# modified changes to indexed files but not added with "git add ."
zstyle ':vcs_info:*' unstagedstr 'M?'
# modifed changes to indexed files but added with "git add ."
zstyle ':vcs_info:*' stagedstr 'R!'

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# aici trebuie hooked in lista ca sa mearga mai multe functii
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='-U' # signify new files with a bang
    fi
}

# https://github.com/mafredri/zsh-async

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%{$fg[magenta]%}git:%{$terminfo[bold]$fg[black]%}(%{$fg[magenta]%}%b%%{$terminfo[bold]$fg[black]%}[%{$fg[red]%}%m-%u-%c%{$terminfo[bold]$fg[black]%}])"


# TODO look into this for more colors
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# also ascii escape codes
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples





# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# local cwd="${PWD/#$HOME/~}"
# cwd_list=(${(s:/:)cwd})
# right_powerline_arrow=$"\ue0b1"
# cwd=${(j: $right_powerline_arrow :)cwd_list}



# VCS
YS_VCS_PROMPT_PREFIX=" %{$fg[green]%}("
YS_VCS_PROMPT_SUFFIX=""
YS_VCS_PROMPT_DIRTY=") %{$fg[red]%}x%{$reset_color%}"
YS_VCS_PROMPT_CLEAN=")"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Prompt format: \n [USER@MACHINE:DIRECTORY] (BRANCH) STATE [TIME] \n $

current_time="%{$terminfo[bold]$fg[black]%}[%*]"

left_square_bracket="%{$terminfo[bold]$fg[black]%}["
right_square_bracket="$fg[black]%}]"

username_at_machine_name="%{$fg[red]%}%n@$(box_name)"

current_working_directory="$fg[yellow]%}${current_dir}%{"


# git_status="%{$fg[cyan]%}${git_info}[$(git_prompt_short_sha)]"
git_status="%{$fg[cyan]%}${git_info}"


cursor="%{$terminfo[bold]$fg[white]%}> %{$reset_color%}"



export ssh_active="false"

function update_prompt_and_venv () {
    local ssh_mode=""
    local root_mode=""
    local virtual_environment=""

    if [ $VIRTUAL_ENV ]; then
        virtual_environment="%{$terminfo[bold]$fg[black]%}(%{$terminfo[bold]$fg[cyan]%}$(basename $VIRTUAL_ENV)%{$terminfo[bold]$fg[black]%}) "
    fi

    if [[ $UID == 0 || $EUID == 0 ]]; then
        # sudo mode
        root_mode="%{$terminfo[bold]$fg[black]%}[$reset_color%{$terminfo[bold]$fg[red]%}sudo%{$terminfo[bold]$fg[black]%}] "
    fi

    if [ $SSH_CONNECTION ]; then
        export ssh_active="true"
        ssh_connection=$SSH_CONNECTION
        ssh_list=(${(s: :)ssh_connection})
        host_ip=$ssh_list[3]
        ssh_mode="$fg[blue]ssh%{$terminfo[bold]$fg[black]%}:(%{$terminfo[bold]$fg[blue]%}$host_ip% $terminfo[bold]$fg[black]%})$reset_color "

    elif [ ssh_active == "true"]; then
        ssh_mode="$fg[blue]ssh%{$terminfo[bold]$fg[black]%}:(%{$terminfo[bold]$fg[blue]%}DA% $terminfo[bold]$fg[black]%})$reset_color "

    fi

    PROMPT="
$ssh_mode$root_mode$virtual_environment$left_square_bracket$current_working_directory$right_square_bracket \$vcs_info_msg_0_
$cursor"

}
precmd_functions+=(update_prompt_and_venv)



# how about using pypy sau binary

# pentru ca e prea slow la prompt
# function async_update_git_hunks() {
#     shortstat=$(git diff --shortstat)
#     # prompt_hunks=$(python3 $ZDOTDIR/zsh_python_scripts/split_hunks.py $shortstat)
#
#     changed_files=$(python3 $ZDOTDIR/zsh_python_scripts/get_changed_files.py $shortstat)
#
#     insertions=$(python3 $ZDOTDIR/zsh_python_scripts/get_insertions.py $shortstat)
#
#     deletions=$(python3 $ZDOTDIR/zsh_python_scripts/get_deletions.py $shortstat)
#
#     git_hunks="%{$terminfo[bold]$fg[yellow]%}$changed_files%{$terminfo[bold]$fg[green]%}$insertions%{$terminfo[bold]$fg[red]%}$deletions"
#
#     echo -e $git_hunks
# }

# function update_prompt_and_git_hunks_live() {
#
#     if [[ -d ".git" ]]; then
#         # git exists
#
#         PROMPT="
# $left_square_bracket$current_working_directory$right_square_bracket
# \$vcs_info_msg_0_%{$terminfo[bold]$fg[black]%}[$git_hunks%{$terminfo[bold]$fg[black]%}])
# %{$terminfo[bold]$fg[white]%}> %{$reset_color%}"
#
#     else
#         PROMPT="
# $left_square_bracket$current_working_directory$right_square_bracket \$vcs_info_msg_0_%{$terminfo[bold]$fg[black]%}[$git_hunks%{$terminfo[bold]$fg[black]%}])
# %{$terminfo[bold]$fg[white]%}> %{$reset_color%}"
#     fi
# }

# precmd_functions+=(update_prompt_and_git_hunks_live)




# RPROMPT="%{$fg[red]%}right prompt%{$reset_color%}"






