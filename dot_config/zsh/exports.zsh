# export FPATH="$FPATH:/home/linuxbrew/.linuxbrew/share/zsh/site-functions"
export FPATH="$FPATH:/usr/share/zsh/vendor-completions"
export PATH="$PATH:/home/$USER/.local/bin"
export PATH="$PATH:/home/$USER/.cargo/bin"
export PATH="$PATH:/home/$USER/.dotnet/tools"
export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"
export PATH="/home/linuxbrew/.linuxbrew/opt/node@22/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/opt/binutils/bin:$PATH"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
export HOMEBREW_AUTO_UPDATE_SECS=1800
export TZ="America/Montevideo"
export EDITOR=nvim
# export HOMEBREW_TEMP=/var/tmp

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
