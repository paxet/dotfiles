# dotfiles
My dotfiles for [neovim](https://wiki.archlinux.org/index.php/Neovim), [fish shell](https://wiki.archlinux.org/index.php/Fish), [tilix](https://gnunn1.github.io/tilix-web/), [pacman hooks](https://wiki.archlinux.org/index.php/Pacman), [systemd unit files](https://wiki.archlinux.org/index.php/Systemd) and more.

## Nerd Font
A nerd font must be installed. Currently using 'Inconsolata' for the shell and Fira Code for VSCode

    $] wget -c https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete%20Mono.otf
    $] wget -c https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf
    $] wget -c https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Medium/complete/Fura%20Code%20Medium%20Nerd%20Font%20Complete%20Mono.otf
    $] mkdir --parents ~/.local/share/fonts
    $] mv *.otf ~/.local/share/fonts/
    $] chmod 644 ~/.local/share/fonts/*.otf
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
Place it in: /etc/pacman.d/hooks

Then install:

    $] sudo pacman -S reflector pacman-contrib

Explanation:

> mirrorupgrade.hook -> Uses "reflector" to update mirrorlist when a new version of pacman-mirrorlist gets installed.
>
> orphanedpackages.hook -> Search for orphaned packages after a system upgrade and lists it.
>
> systemd-boot.hook -> Updates systemd-boot when systemd is upgraded.
>
> remove_old_cache.hook -> Remove all but the currently installed and the previously used cache

## Udev Rules
Place it in: /etc/udev/rules.d/

> 60-ioscheduler.rules -> First add "scsi_mod.use_blk_mq=1" as kernel parameter. Afterwards will use multi-queue scheduler, md-deadline for non-rotational disks and bfq for rotational ones.

## Visual Studio Code
Superb editor with pipenv support to manage python projects. Currently using OSS version from AUR.

    $] aurman -S code

Plugins for VSCode I use. Install bia Ctrl+P:

| Command                                            | Description                                            |
| -------------------------------------------------- | ------------------------------------------------------ |
| ext install ms-python.python                       | *(For Python development)*                             |
| ext install njpwerner.autodocstring                | *(Helper to create function documentation)*            |
| ext install wholroyd.jinja                         | *(Syntax highlighting for jinja2 templates)*           |
| ext install piotrpalarz.vscode-gitignore-generator | *(Generate .gitignore from https://www.gitignore.io/)* |
| ext install file-icons.file-icons                    | *(Icons to represent file types in the project tree)*   |
| ext install wayou.vscode-todo-highlight            | *(Highlight TODOs, FIXMEs and more)*                   |
| ext install lihui.vs-color-picker                  | *(Useful to select color code)*                        |
| ext install joaompinto.asciidoctor-vscode          | *(Preview for asciidoc files)*                          |

