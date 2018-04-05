# dotfiles
My dotfiles for [neovim](https://wiki.archlinux.org/index.php/Neovim), [fish shell](https://wiki.archlinux.org/index.php/Fish), [pacman hooks](https://wiki.archlinux.org/index.php/Pacman), [systemd unit files](https://wiki.archlinux.org/index.php/Systemd) and more.

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

## Fish shell
Really interesting one. Not for a login shell replacement but for dayli use launching it through Tilix

    $] omf install bobthefish
    $] omf theme bobthefish

## Pacman hooks
Place it in: /etc/pacman.d/hooks/

> mirrorupgrade.hook -> Uses "reflector" to update mirrorlist when a new
> version of pacman-mirrorlist gets installed. orphanedpackages.hook ->
> Search for orphaned packages after a system upgrade and lists it.
> systemd-boot.hook -> Updates systemd-boot when systemd is upgraded.

## Currently not in use
Tools used in the past, only here for legacy purpouses because maybe someday I'll use it again.


### Zsh
Seems history search is not functioning with my config.


### Terminator
Used brefly untill I fell in love with Tilix.

