# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
$env.PATH = ($env.PATH | append '/home/linuxbrew/.linuxbrew/bin/')
$env.PATH = ($env.PATH | append '/home/linuxbrew/.linuxbrew/sbin/')
$env.PATH = ($env.PATH | append '/home/linuxbrew/.linuxbrew/opt/libpq/bin')
$env.PATH = ($env.PATH | append $"($env.HOME)/.local/bin")
$env.EDITOR = 'nvim'

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"

$env.PYTHON_FOR_REGEN = '/usr/bin/python'

source-env ~/.config/nushell/.env.nu

carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
atuin init nu | save -f ~/.local/share/atuin/init.nu
zoxide init nushell | save -f ~/.zoxide.nu

if ($env.PWD | str starts-with "/var/home") {
    cd ("/" | append (pwd | path split | skip 2) | path join)
}

$env.config.show_banner = false

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

$env.config.buffer_editor = 'nvim'
$env.config.edit_mode = 'vi'
$env.cursor_shape.vi_insert = 'line'

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# path join (not path expand) keeps the $HOME spelling — resolving the
# /home -> /var/home symlink here puts the shims dir on PATH under two
# spellings, which breaks pyenv's shim recursion guard and hangs uv
$env.PYENV_ROOT = ($env.HOME | path join ".pyenv")
if (( $"($env.PYENV_ROOT)/bin" | path type ) == "dir") {
  $env.PATH = $env.PATH | prepend $"($env.PYENV_ROOT)/bin" }
$env.PATH = $env.PATH | prepend $"($env.PYENV_ROOT)/shims"
pyenv rehash

if not (which fnm | is-empty) {
    ^fnm env --json | from json | load-env

    $env.PATH = $env.PATH | prepend ($env.FNM_MULTISHELL_PATH | path join (if $nu.os-info.name == 'windows' {''} else {'bin'}))
    $env.config.hooks.env_change.PWD = (
        $env.config.hooks.env_change.PWD? | append {
            condition: {|| ['.nvmrc' '.node-version', 'package.json'] | any {|el| $el | path exists}}
            code: {|| ^fnm use}
        }
    )
}

source ~/.zoxide.nu
source $"($nu.cache-dir)/carapace.nu"
source ~/.local/share/atuin/init.nu
source ~/.local/share/nushell/vendor/autoload/wt.nu
source ./aliases.nu

$env.LANG = "C.UTF-8"
$env.LC_ALL = "C.UTF-8"
