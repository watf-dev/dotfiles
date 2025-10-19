# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source ${ZDOTDIR}/zinitrc

export LANG=en_US.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

export VISUAL=vim
export EDITOR=vim
export GIT_EDITOR=vim
bindkey -e #emacs
export HISTFILE=${HOME}/.zsh_history

typeset -gT PYTHONPATH pythonpath
typeset -xU path PATH pythonpath PYTHONPATH fpath FPATH ld_library_path LD_LIBRARY_PATH

source ${ZDOTDIR}/plugin.zshrc
autoload -Uz compinit && compinit -u

WORDCHARS=${WORDCHARS:s,/,,}

export PYTHONHISTORY=${HOME}/.pyhistory
export PYTHONSTARTUP=${HOME}/.pystartup

function chpwd() { ls --color=auto }
alias la="ls -a"
alias ll="ls -l"
alias google-chrome='open -a "Google Chrome"'
alias arc='open -a "Arc"'
alias copycmd="fc -ln -1 | pbcopy"

# export CDS_LIC_FILE=5281@ivie7.mems.rice.edu

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/lib/python3.10/site-packages:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# debug for C++
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# for python module
# export PYTHONPATH="/Users/fukudawataru/SCRIPT:$PYTHONPATH"
# export PYTHONPATH="/Users/fukudawataru/SCRIPT/tafsm_mg:$PYTHONPATH"
export PYTHONPATH="/Users/fukudawataru/wataru-src/module:$PYTHONPATH"

# for python script
export PATH="/Users/fukudawataru/wataru-src/script/wataru_mg:$PATH"
export PATH="/Users/fukudawataru/wataru-src/script/wataruxmf:$PATH"
export PATH="/Users/fukudawataru/wataru-src/script/wataru-util:$PATH"
export PATH="/Users/fukudawataru/wataru-src/script/wataru-util/tafsm_util:$PATH"
export PATH="/Users/fukudawataru/wataru-src/script/watf:$PATH"
export PATH="/Users/fukudawataru/wataru-src/script/watfmesh:$PATH"
export PATH="/Users/fukudawataru/wataru-src/script/watf_paraview:$PATH"


# for paraview
export PATH="/Applications/ParaView-5.13.1.app/Contents/bin:$PATH"

# for C++ compile
# export CPLUS_INCLUDE_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"

### for OpenFOAM
# source /Applications/OpenFOAM-v2406.app/Contents/Resources/etc/bashrc
# source /Applications/OpenFOAM-v2406.app/Contents/Resources//etc/bashrc
# source /Users/fukudawataru/TUM/Study/Computation/OpenFOAM/OpenFOAM-dev/etc/bashrc
# source $HOME/OpenFOAM/OpenFOAM-dev/etc/bashrc

### for docker
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
export PATH="/Users/fukudawataru/bin:$PATH"


### alias_default ###
alias ls='ls --color=always -F'
alias mv='nocorrect mv'        # no spelling correction on mv
alias cp='nocorrect cp'        # no spelling correction on cp
alias rm='nocorrect rm'        # no spelling correction on cp
alias mkdir='nocorrect mkdir'  # no spelling correction on mkdir
#########

### completion_default ###
### menu
zstyle ':completion:*:default' menu select=1

### matcher
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

### to use color
if [ -z "$LS_COLORS" -a "$(uname -s)" != "Darwin" ]; then
  eval $(dircolors)
fi
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
export LS_COLORS="${LS_COLORS//di=01;34/di=01;36}"

### cache
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $HOME/.zcompcache

### etc
zstyle ':completion:*:expand:*' tag-order all-expansio
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'

### add keys
zmodload -i zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
#########

### history_default.snippet ###
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
bindkey '^P' history-beginning-search-backward
########

### keybind_default ###
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
bindkey ' ' magic-space
#########

### keybind_history ###
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey '^V' history-incremental-search-forward
#bindkey '^R' history-incremental-search-backward
bindkey '^W' history-incremental-search-backward
#bindkey '^E' push-input
bindkey '^Y' yank
bindkey '^U' undo
bindkey '^R' redo
#########

# ### setopt_default ###
DIRSTACKSIZE=20
setopt list_packed
setopt print_eight_bit
setopt menu_complete
setopt no_clobber
setopt no_hup
setopt no_beep
setopt nobeep
setopt nolistbeep
setopt extended_glob
setopt numeric_glob_sort
setopt auto_cd
setopt auto_pushd
setopt correct
setopt no_checkjobs
setopt pushd_to_home
setopt pushd_ignore_dups
setopt pushd_silent
setopt interactive_comments
setopt magic_equal_subst
setopt nobanghist
# setopt rm_star_silent
# setopt rm_star_wait
# setopt chase_links
# setopt notify globdots correct pushdtohome cdablevars
# setopt automenu
# setopt auto_list
# setopt correctall autocd recexact longlistjobs
# setopt autoresume histignoredups pushdsilent noclobber
# setopt pushdminus extendedglob rcquotes mailwarning
# unsetopt bgnice autoparamslash
#########


# ### fzf ### 
# # for fzf (fzf-tumux)
# export FZF_COMPLETION_TRIGGER=','
# typeset -Tgx FZF_DEFAULT_OPTS fzf_default_opts " " 
# fzf_default_opts=(
#   '--border'
#   '--inline-info'
#   '--prompt="➜  "'
#   '--margin=0,2'
#   '--tiebreak=index'
#   '--height=50'
#   '--no-mouse'
#   '--filepath-word'
# )
#   #'--height=90%'
# # remove reverse 
# #  '--height=90%'
#
# () {
#   local -A color_map=(
#     [fg]='-1'
#     [bg]='-1'
#     [hl]='33'
#     [fg+]='250'
#     [bg+]='235'
#     [hl+]='33'
#     [info]='37'
#     [prompt]='37'
#     [pointer]='230'
#     [marker]='230'
#     [spinner]='37'
#   )
#
#   for x in "${(k)color_map[@]}"; do
#     fzf_color_opts+=("${x}:${color_map[${x}]}") 
#   done
#   fzf_default_opts+=( '--color="'"${(j.,.)fzf_color_opts}"'"' )
# }
#
# () {
#   local -a fzf_bind_opts=()
#   local -A bind_map=(
#     [?]='toggle-preview'
#     [ctrl-k]='kill-word'
#     [ctrl-space]='toggle'
#     [ctrl-a]='beginning-of-line'
#     [alt-a]='toggle-all'
#     ['ctrl-]']='replace-query'
#     [ctrl-w]='backward-kill-word'
#     [ctrl-x]='jump'
#     [ctrl-z]='ignore'
#     [ctrl-B]='preview-page-up'
#     [ctrl-F]='preview-page-down'
#   )
#
#   for x in "${(k)bind_map[@]}"; do
#     fzf_bind_opts+=("${x}:${bind_map[${x}]}")
#   done
#   fzf_default_opts+=( '--bind="'"${(j:,:)fzf_bind_opts}"'"' )
# }
# #########

# ### history_select ###
# # require fzf
# function select-history() {
#   BUFFER=$(history -n -r 1 | fzf-tmux --bind ctrl-a:beginning-of-line	--no-sort +m --query "$LBUFFER" --prompt="History > ")
# 	  CURSOR=$#BUFFER
# 	}
# zle -N select-history
# bindkey '^r' select-history
# #########

### Kratos ###

