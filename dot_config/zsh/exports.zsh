eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
export FPATH="$FPATH:/home/linuxbrew/.linuxbrew/share/zsh/site-functions"
export FPATH="$FPATH:/usr/share/zsh/vendor-completions"
export PATH="$PATH:/home/bruno/.local/bin"
export PATH="$PATH:/home/bruno/.cargo/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/opt/binutils/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/dotnet@6/bin:$PATH"
export HOMEBREW_AUTO_UPDATE_SECS=1800
export EDITOR=nvim

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
