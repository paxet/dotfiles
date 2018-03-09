# dotfiles
My dotfiles for neovim, zsh, fish shell (playing with it lately)...

## Nerd Font
A nerd font must be installed. Currently using 'Inconsolata'

$] wget -c https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete%20Mono.otf
$] wget -c https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
$] mkdir --parents ~/.local/share/fonts
$] mv Inconsolata*.otf ~/.local/share/fonts/
$] chmod 644 ~/.local/share/fonts/Inconsolata*.otf
$] fc-cache

## Tilix tiling terminal emulator
To load tiling settings:
$] dconf load /com/gexperts/Tilix/ < tilix.dconf

## Virtualenv for python
Install virtualenv module to use autoactivation in zsh and/or fish
$] sudo pip3 install virtualenv

## Zsh
Seems history search is not functioning

## Fish shell
$] omf install bobthefish
$] omf theme bobthefish

## Terminator
Used brefly in the past
