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
SPACESHIP_DIR_PREFIX='In '
SPACESHIP_PROMPT_DEFAULT_PREFIX='with '
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_AZURE_SHOW=false
SPACESHIP_JAVA_SHOW=false
SPACESHIP_AWS_SYMBOL='☁️  '
SPACESHIP_VENV_COLOR='#d6ba5f'
SPACESHIP_VENV_SYMBOL='venv:'
SPACESHIP_VENV_PREFIX='in '
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_PROMPT_ORDER=(
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  package        # Package version
  node           # Node.js section
  python         # Python section
  venv           # virtualenv section
  golang         # Go section
  kotlin         # Kotlin section
  java           # Java section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  gcloud         # Google Cloud Platform section
  azure          # Azure section
  conda          # conda virtualenv section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section
  ibmcloud       # IBM Cloud section
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
    zsh-autosuggestions
    direnv
    nvm
    jenv
    pyenv
    git
    docker
    aws
    gcloud
    terraform
)

# Source Oh My ZSH
source $ZSH/oh-my-zsh.sh

########################
## User configuration ##
########################

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


# TODO: TRIAGE
