#Test if we have oh-my-fish or download it
if test -f ~/.config/fish/conf.d/omf.fish
    #Install plugins and theme
    if type -q omf
        #Set theme to bobthefish, or install it
        if test -d ~/.local/share/omf/themes/bobthefish
            omf theme bobthefish
        else
            omf install bobthefish
        end
        #Test for virtualfish
        if test -d ~/.local/share/omf/pkg/virtualfish
            ;;
        else
            omf install virtualfish
        end
    end
else
    curl -L https://get.oh-my.fish | source
end

#Using nerd fonts to have better theme graphics <https://github.com/ryanoasis/nerd-fonts>:
set -g theme_nerd_fonts yes
set -g theme_title_display_process yes
set -g theme_display_date no
set -g default_user paxet
set -g theme_color_scheme zenburn
#set -g theme_color_scheme solarized

#Virtualfish default to python3
set VIRTUALFISH_PYTHON python3
#Auto activate virtualenv when cd into a python project dir
set VIRTUALFISH_PLUGINS "auto_activation"

