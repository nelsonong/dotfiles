# .zshrc

###################################################
#                      INIT                       #
###################################################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/nelson/.zshrc'

# Init zsh config
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

###################################################
#                   POWERLINE                     #
###################################################
#export POWERLINE_DIR=/usr/lib/python3.6/site-packages/powerline
#. $POWERLINE_DIR/bindings/zsh/powerline.zsh

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
alias v='nvim'
alias sv='sudo nvim'
alias ld='ldmc -l'
alias rd='sudo ldmc -r'
alias rb='sudo shutdown -r now'
alias p='sudo shutdown -h now'

alias zz="systemctl suspend"
alias rw="nmcli radio wifi off && sleep 5 && nmcli radio wifi on"

alias q='xbps-query -Rs'
alias i='sudo xbps-install'
alias u='sudo xbps-install -Su'
alias r='sudo xbps-remove -R'
alias c='sudo xbps-remove -Oo'

alias status='git status'
alias pull='git pull'
alias commit='git commit -m'
alias push='git push --set-upstream origin master'

alias cddf='cd $HOME/dotfiles'
alias cddl='cd $HOME/Downloads'
alias cds='cd $HOME/.config/scripts'
alias dtheme='cd $HOME/.urxvt'
alias dhd='cd /mnt'

alias vbash='$EDITOR $HOME/.bashrc'
alias lbash='leafpad $HOME/.bashrc'
alias vzsh='$EDITOR $HOME/.zshrc'
alias lzsh='leafpad $HOME/.zshrc'
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

alias m='ncmpcpp'
alias play='mpc toggle'
alias pause='mpc toggle'
alias prev='mpc prev'
alias next='mpc next'
alias up='amixer -q sset Master 5%+'
alias down='amixer -q sset Master 5%-'
alias mute='amixer -q sset Master toggle'

alias rasp='ssh pi@192.168.88.245'

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

