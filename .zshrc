# Load plugins: modern completion system and prompt themes
autoload -Uz compinit #promptinit
compinit
# promptinit
# prompt -l adam1

# history config
setopt histignorealldups sharehistory
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# load virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
if ! type "virtualenvwrapper.sh" > /dev/null; then
  echo "YOU MUST DO: pip3 install virtualenvwrapper"
else
  source =virtualenvwrapper.sh
fi

# download zgen if we don't have it
if [[ ! -a "${HOME}/.zgen/zgen.zsh" ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

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
  #ZSH port of the FISH shell's history search
  zgen load zsh-users/zsh-history-substring-search

  # generate the init script from plugins above
  zgen save
fi

#Need to source vte.sh for Tilix terminal to work properly
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  export TERM="xterm-256color"
  VTE_FILE="/etc/profile.d/vte.sh"
  VTE_FILE_VERS="/etc/profile.d/vte-2.91.sh"
  if [ -e "$VTE_FILE" ]; then
    source "$VTE_FILE"
  elif [ -e "$VTE_FILE_VERS" ]; then
    source "$VTE_FILE_VERS"
  fi
fi

### My customizations
# add user to hide user from command prompt
DEFAULT_USER=paxet

# set neovim or vim as default editor
if ! type "nvim" > /dev/null; then
    export EDITOR="vi"
else
    export EDITOR="nvim"
fi

# bind UP and DOWN arrow keys to zsh-history-substring-search
# if it doesn't work, replace bindings, by the ones found wit:
# $] cat -v (press arrow UP and then arrow DOWN to see the characters)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# home and end keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# aliases
alias ls="pwd; ls --color=auto"
alias terminator="terminator -l 3term"

# colors
if [[ -a "${HOME}/.dir_colors/dircolors" ]]; then
  eval `dircolors ~/.dir_colors/dircolors`
fi

