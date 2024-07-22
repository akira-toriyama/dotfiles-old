#! /bin/bash

brew upgrade

asdf plugin update --all
asdf global nodejs latest
asdf global golang latest
asdf global rust latest
asdf global deno latest
asdf direnv setup --shell zsh --version latest
asdf local deno latest

# yabai
# https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
yabai --stop-service
yabai --uninstall-service
brew upgrade yabai
yabai --start-service

echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa
yabai --start-service
