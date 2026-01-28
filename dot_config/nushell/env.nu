# env.nu
#
# Installed by:
# version = "0.107.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
$env.PATH = ($env.PATH | append '/home/linuxbrew/.linuxbrew/bin/')
$env.EDITOR = 'nvim'
zoxide init nushell | save -f ~/.zoxide.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

atuin init nu | save -f ~/.local/share/atuin/init.nu
$env.PYTHON_FOR_REGEN = '/usr/bin/python'
source-env ~/.config/nushell/.env.nu
