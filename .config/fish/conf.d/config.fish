set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
# Configure fisher as plugin system for fish and some plugins
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if type -q poetry
    if test ! -f $XDG_CONFIG_HOME/fish/completions/poetry.fish
        mkdir --parents $XDG_CONFIG_HOME/fish/completions/
        poetry completions fish > $XDG_CONFIG_HOME/fish/completions/poetry.fish
        switch $SHELL
            case /usr/bin/fish /bin/fish /usr/local/bin/fish
                builtin source ~/.config/fish/completions/poetry.fish
            case '*'
                # The first time with fish
                echo "### SHELL variable not pointing at fish. Be sure it's your default shell or"
                echo "    export SHELL=/bin/fish before launching Fish Shell"
                echo "### Poetry completion will be enabled in future fish sessions and needs the"
                echo "    SHELL variable set to fish to work properly."
        end
    end
end
        

# Set this to tell activate.fish in virtualenv to don't echo name in prompt
set VIRTUAL_ENV_DISABLE_PROMPT 1

# Apply customization to your liking from here...
# Aliases...
# Global Variables...

