# export FPATH="$FPATH:/home/linuxbrew/.linuxbrew/share/zsh/site-functions"
export FPATH="$FPATH:/usr/share/zsh/vendor-completions"
export PATH="$PATH:/home/$USER/.local/bin"
export PATH="$PATH:/home/$USER/.cargo/bin"
export PATH="$PATH:/home/$USER/.dotnet/tools"
export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"
export PATH="/home/linuxbrew/.linuxbrew/opt/dotnet@8/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/opt/binutils/bin:$PATH"
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
export HOMEBREW_AUTO_UPDATE_SECS=1800
export TZ="America/Montevideo"
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
# export HOMEBREW_TEMP=/var/tmp
export PNPM_HOME="/home/bruno/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
