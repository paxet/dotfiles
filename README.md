# dotfiles
My dotfiles for [neovim](https://wiki.archlinux.org/index.php/Neovim), [fish shell](https://wiki.archlinux.org/index.php/Fish), [tilix](https://gnunn1.github.io/tilix-web/), [pacman hooks](https://wiki.archlinux.org/index.php/Pacman), [systemd unit files](https://wiki.archlinux.org/index.php/Systemd) and more.

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

## Pipenv for managing python virtualenvs and dependencies
Create/manage virtualenvs and dependencies with ease.

    $] sudo pip3 install pipenv

## Fish shell
My default shell for daily use. Really interesting one with nice features.

    $] cp dotfiles/.config/fish/conf.d/config.fish ~/.config/fish/conf.d/
    $] chsh -s /usr/bin/fish
    $] fish

## Pacman hooks
Place it in: /etc/pacman.d/hooks/

> mirrorupgrade.hook -> Uses "reflector" to update mirrorlist when a new version of pacman-mirrorlist gets installed.
>
> orphanedpackages.hook -> Search for orphaned packages after a system upgrade and lists it.
>
> systemd-boot.hook -> Updates systemd-boot when systemd is upgraded.
>
> remove_old_cache.hook -> Remove all but the currently installed and the previously used cache
