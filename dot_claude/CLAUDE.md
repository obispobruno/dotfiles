- Always load skills even if there is a 1% chance that they might be useful
- Never add Co-Authored-By: Claude to commits
- Never add 🤖 Generated with Claude Code to pull requests

## draw.io export (this machine)
- The `drawio` CLI is NOT on PATH. It is installed via flatpak: `com.jgraph.drawio.desktop`.
- Export: `flatpak run com.jgraph.drawio.desktop -x -f png -e -b 10 -o output.drawio.png input.drawio`
- The flatpak sandbox CANNOT write to `/tmp` (silently fails with "No such file"). Output MUST go to a path under the working directory/repo.
- Run from the .drawio's directory; relative paths for both input and output work.
- Quick detection: `flatpak list | grep -i drawio`
