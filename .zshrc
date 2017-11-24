# prompt theme system, not in use because of forcing agnoster-theme later
#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# download zgen if we don't have it
if [[ ! -a ~/.zgen/zgen.zsh ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

# load virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source =virtualenvwrapper.sh

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  # 256 color terminal
  zgen load chrissicool/zsh-256color
  # theme
  zgen load paxet/agnoster-zsh-theme agnoster.zsh-theme
  # auto activate virtualenv when cd to Python project
  zgen load MichaelAquilina/zsh-autoswitch-virtualenv
  # aliases reminder
  zgen load MichaelAquilina/zsh-you-should-use
  # completions
  zgen load zsh-users/zsh-completions src

  # generate the init script from plugins above
  zgen save
fi

### My customizations
# add user to hide user from command prompt
DEFAULT_USER=paxet

# aliases
alias ls="ls --color=auto"
alias terminator="terminator -l 3term"
