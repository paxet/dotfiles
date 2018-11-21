# Configure fisherman as plugin system for fish and some plugins
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set this to tell activate.fish in virtualenv to don't echo name in prompt
set VIRTUAL_ENV_DISABLE_PROMPT 1

# Apply customization to your liking from here...
# Aliases...
# Global Variables...

