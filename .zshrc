alias la="ls -larth"
DIRSTACKSIZE=8
ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
autoload -U colors && colors
autoload -U promptinit
promptinit
PROMPT="%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}% "
precmd() {
	PROMPT="%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}% "
}
zle-keymap-select() {
    PROMPT="%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}% "
    [[ $KEYMAP = vicmd ]] && PROMPT="%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}% "
    () { return $__prompt_status }
    zle reset-prompt
}
zle-line-init() {
	typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/tom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.zshrc.local
