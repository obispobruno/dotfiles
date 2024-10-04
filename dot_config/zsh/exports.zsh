# export FPATH="$FPATH:/home/linuxbrew/.linuxbrew/share/zsh/site-functions"
export FPATH="$FPATH:/var/usr/share/zsh/vendor-completions"
export PATH="$PATH:/var/home/bruno/.local/bin"
export PATH="$PATH:/var/home/bruno/.cargo/bin"
export PATH="$PATH:/home/bruno/.dotnet/tools"
export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/var/home/linuxbrew/.linuxbrew/opt/binutils/bin:$PATH"
export XDG_DATA_DIRS="/var/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
export HOMEBREW_AUTO_UPDATE_SECS=1800
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
