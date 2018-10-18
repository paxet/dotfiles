# Configure fisherman as plugin system for fish and some plugins
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set mygreet "function fish_greeting
    set_color \$fish_color_autosuggestion
    echo (date \"+%H:%M:%S\")' | '(uname -o)' | '(whoami)'@'(hostname)
    set_color normal
end"
if test ! -f ~/.config/fish/functions/fish_greeting.fish
    # If no greeting, set it to show: machine name, users and OS
    eval $mygreet
    funcsave fish_greeting
end

# Set this to tell activate.fish in virtualenv to don't echo name in prompt
set VIRTUAL_ENV_DISABLE_PROMPT 1

# Apply customization to your liking from here...
# Aliases...
# Global Variables...

