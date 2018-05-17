# Configure fisherman as plugin system for fish and some plugins
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
            switch $SHELL
                case /usr/bin/fish /bin/fish /usr/local/bin/fish
                    builtin source ~/.config/fish/completions/pipenv.fish
                case '*'
                    # The first time with fish
                    echo "### SHELL variable not pointing at fish. Be sure it's your default shell or"
                    echo "    export SHELL=/bin/fish before launching Fish Shell"
                    echo "### Pipenv completion will be enabled in future fish sessions and needs the"
                    echo "    SHELL variable set to fish to work properly."
            end
        end
    else
        echo "### I suggest you to install pipenv for managing "
        echo "    Python virtualenvs and dependencies"
        echo "### Then you need to: \ue0b0 fisher pipenv"
    end

    # If we are running fish with tilix, we'll need fish-vte
    if set -q TILIX_ID 
        if set -q modules
            set modules fish-vte $modules
        else
            set modules fish-vte
        end
    end

    # Install modules priorly declared/configured
    if set -q modules
        fisher $modules; and echo "### Got it. Enjoy.";
        set -e modules
    end
end

if test ! -f ~/.config/fish/functions/fish_greeting.fish
    # If there is no greeting, set it to show: machine name, uptime, users, load...
    function fish_greeting
        set_color $fish_color_autosuggestion
        uname -nor
        uptime
        set_color normal
    end
    funcsave fish_greeting
end

# Apply customization to your liking from here...
# Aliases...
# Global Variables...