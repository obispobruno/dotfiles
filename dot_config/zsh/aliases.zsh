#!/bin/zsh

# Flatpak
alias fpki="flatpak install"
alias fpks="flatpak search"
alias fpkr="flatpak uninstall"
alias fpkl="flatpak list"
alias fpkla="flatpak list --app"
alias fpku="flatpak update"

# dnf
alias dnfi="sudo dnf install"
alias dnfs="dnf search"
alias dnfp="dnf provides"
alias dnfr="sudo dnf remove"
alias dnfu="sudo dnf upgrade"
alias dnfur="sudo dnf upgrade --refresh"
alias dnfcu="dnf check-update"
alias dnfcur="dnf check-update --refresh"
alias dnfar="sudo dnf autoremove"

# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gst="git stash"
alias gsh="git show"
alias gd="git diff"
alias gp="git push"
alias gpf="git push --force-with-lease"

# General
alias v="nvim"
alias cd="z"
alias code="flatpak run com.visualstudio.code"
alias qw="setxkbmap us && setxkbmap -model 'asus_laptop'"
alias yz="yazi"
alias w='wl-copy'
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias ce='chezmoi edit'
alias ccd='chezmoi cd'
alias cea='chezmoi edit --apply'
alias cat='bat'
alias ls='eza'
alias la='eza -la'
alias ll='eza -l'
alias l='eza -l'
alias lt='eza --tree --level 2 --icons --git'
alias tree='eza --tree'
alias yz='yazi'
alias fwine="flatpak run org.winehq.Wine"
alias gpudriver="glxinfo | grep -iE 'vendor:|device:|version:'"
alias updategrub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias wgu="sudo wg-quick up wg0"
alias wgd="sudo wg-quick down wg0"
