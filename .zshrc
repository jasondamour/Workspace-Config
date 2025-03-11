export ZSH="$HOME/.oh-my-zsh"

# Homebrew
if [ -e /opt/homebrew/ ]; then
  FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pyenv
# Has to be configured before sourcing omz due to bug
if [ -e $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PATH:$PYENV_ROOT/bin"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Plugin configuration
SHOW_AWS_PROMPT=false
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# Spaceship configuration
ZSH_THEME='spaceship'
SAPCESHIP_PROMPT_ASYNC='false'
SPACESHIP_PROMPT_DEFAULT_PREFIX='with '
SPACESHIP_DIR_PREFIX='In '
SPACESHIP_GIT_STATUS_SHOW='false'
SPACESHIP_AWS_SYMBOL='☁️ '
SPACESHIP_VENV_COLOR='#d6ba5f'
SPACESHIP_VENV_SYMBOL='venv:'
SPACESHIP_VENV_PREFIX='in '
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_PROMPT_ORDER=(
  # Directory info
  user           # Username section
  host           # Hostname section
  dir            # Current directory section
  git            # Git section (git_branch + git_status)

  # Local environments
  venv           # virtualenv section
  conda          # conda virtualenv section
  docker_compose # Docker section

  # Remote environments
  aws            # Amazon Web Services section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section

  # Prompt info
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)


# Plugins
plugins=(
    direnv
    nvm
    jenv
    pyenv
    git
    docker
    aws
    gcloud
    terraform
    rust
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Source Oh My ZSH
source $ZSH/oh-my-zsh.sh

########################
## User configuration ##
########################

# Shell configurations
export WORDCHARS='_-'
export EDITOR="code -w"

# WSL Configs
if python3 -mplatform | grep -i ubuntu &>/dev/null; then
  export BROWSER=wslview
fi

# Atuin shell history
if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# Colima
if [ -e ${HOME}/.colima/default/docker.sock ]; then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
fi

# added by Snowflake SnowSQL installer v1.2
if [ -e /Applications/SnowSQL.app/Contents/MacOS ]; then
  export PATH="$PATH:/Applications/SnowSQL.app/Contents/MacOS"
fi

# Pants
if [ -e $HOME/.local/bin ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi



# TODO: TRIAGE
