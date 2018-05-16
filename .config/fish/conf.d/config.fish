# Configure fisherman as plugin system for fish
if test ! -f ~/.config/fish/functions/fisher.fish
    # Firts time init
    echo "### First time launch, will install fisherman and some modules."
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    clear
    builtin source ~/.config/fish/functions/fisher.fish
    
    # ASk to install metro prompt
    if set -q modules
        set modules $modules metro
    else
        set modules metro
    end

    # Python virtualenvs with pipenv
    if type -q pipenv
        # Ask to install pipenv module
        if test ! -d ~/.config/fisherman/pipenv/
            if set -q modules
                set modules pipenv $modules
            else
                set modules pipenv
            end
        end
        # Shell completion for pipenv
        if test ! -f ~/.config/fish/completions/pipenv.fish
            mkdir --parents ~/.config/fish/completions/
            echo "eval (pipenv --completion)" > ~/.config/fish/completions/pipenv.fish
            builtin source ~/.config/fish/completions/pipenv.fish
        end
    else
        echo "### I suggest you to install pipenv for managing "
        echo "    Python virtualenvs and dependencies"
        echo "### Then you need to: \ue0b0 fisher pipenv"
    end

    # Install modules priorly declared/configured
    if set -q modules
        #echo "###"
        #echo "# There are modules you should install."
        #echo "# Please, do it now with: \ue0b0 fisher $modules"
        #echo "###"
        fisher $modules; and echo "### Got it. Enjoy.";
        set -e modules
    end
end

# Apply customization to your liking from here...
# Aliases...
# Global Variables...