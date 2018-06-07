# .zshrc

###################################################
#                      INIT                       #
###################################################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

zstyle :compinstall filename '/home/nelson/.zshrc'

# Init zsh config
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

###################################################
#                   POWERLINE                     #
###################################################
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

###################################################
#                    ALIASES                      #
###################################################
alias sd='sudo'
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias vim='nvim'
alias svim='sudo nvim'
alias v='nvim'
alias sv='sudo nvim'
alias l='leafpad'
alias sl='sudo leafpad'
alias ld='ldmc -l'
alias rd='sudo ldmc -r'
alias rb='sudo shutdown -r now'
alias p='sudo shutdown -h now'

alias zz='systemctl suspend'
alias rw='nmcli radio wifi off && sleep 5 && nmcli radio wifi on'

alias miru='sudo reflector --country Canada --fastest 12 --latest 12 --verbose --save /etc/pacman.d/mirrorlist'

aurpm='aurman'
alias aurqm='$aurpm -Qm'
alias aurqn='$aurpm -Qn'
alias aurs='$aurpm -Syu'
alias aurr='$aurpm -Rs'
alias auru='$aurpm -Syu'
alias pacs='sudo pacman -Syu'
alias pacr='sudo pacman -Rs'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpf='git push --force'
alias gpl='git pull'
alias gd='git diff'
alias gca='git commit --amend'
alias gr='git rebase'

alias cdd='cd $HOME/dotfiles'
alias cddl='cd $HOME/Downloads'
alias cds='cd $HOME/dotfiles/scripts'
alias cdc='cd $HOME/.config'

alias vzsh='$EDITOR $HOME/.zshrc'
alias lzsh='leafpad $HOME/.zshrc'
alias szsh='source $HOME/.zshrc'
alias vxinit='$EDITOR $HOME/.xinitrc'
alias lxinit='leafpad $HOME/.xinitrc'
alias vxres='$EDITOR $HOME/.Xresources'
alias lxres='leafpad $HOME/.Xresources'
alias xload='xrdb -load $HOME/.Xresources'
alias vbspwm='$EDITOR $HOME/.config/bspwm/bspwmrc'
alias lbspwm='leafpad $HOME/.config/bspwm/bspwmrc'
alias vsxhkd='$EDITOR $HOME/.config/sxhkd/sxhkdrc'
alias lsxhkd='leafpad $HOME/.config/sxhkd/sxhkdrc'
alias vpolybar='$EDITOR $HOME/.config/polybar/config'
alias lpolybar='leafpad $HOME/.config/polybar/config'
alias vdotsetup='$EDITOR $HOME/dotfiles/scripts/dotsetup'
alias ldotsetup='leafpad $HOME/dotfiles/scripts/dotsetup'

alias sa='stow bspwm mpd mpv ncmcpp neovim polybar powerline sxhkd tmux xserver zsh'
alias ss='sudo stow scripts -t /usr/local/bin'

alias m='ncmpcpp'
alias play='mpc toggle'
alias pause='mpc toggle'
alias prev='mpc prev'
alias next='mpc next'

alias mntdrive='sudo mount /dev/sdb1 /mnt/drive'
alias umntdrive='sudo umount /mnt/drive'

alias ovpn='sudo openvpn /etc/openvpn/client/client.conf'

alias gdrive="$GOPATH/bin/drive"

###################################################
#                     EXPORT                      #
###################################################
export TERM='xterm-256color'
export BROWSER='google-chrome'
export VISUAL='nvim'
export EDITOR='nvim'
export MPD_HOST=127.0.0.1

export GOPATH=$HOME/gopath
export PATH=$GOPATH:GOPATH/bin:$PATH

###################################################
#                RESTORE KEYBINDS                 #
###################################################
bindkey -e

