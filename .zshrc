export ZSH="$HOME/.oh-my-zsh"

# Enable autoenv
if python3 -mplatform | grep -i macos &>/dev/null; then
source '/opt/homebrew/opt/autoenv/activate.sh'
elif python3 -mplatform | grep -i ubuntu &>/dev/null; then
  source ~/.autoenv/activate.sh
fi


# Plugin configuration
SHOW_AWS_PROMPT=false
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# Spaceship configuration
ZSH_THEME='spaceship'
SPACESHIP_DIR_PREFIX='In '
SPACESHIP_PROMPT_DEFAULT_PREFIX='with '
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_AWS_SYMBOL='☁️  '
SPACESHIP_VENV_COLOR='#d6ba5f'
SPACESHIP_VENV_SYMBOL='venv:'
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
    git
    docker
    aws
    gcloud
    autoenv
    virtualenvwrapper
    zsh-autosuggestions
)

# Init zsh
source $ZSH/oh-my-zsh.sh

# User configuration
if python3 -mplatform | grep -i macos &>/dev/null; then
  eval "$(jenv init -)"
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
  export BUILDKIT_NO_CLIENT_TOKEN=true
  fpath+=/opt/homebrew/share/zsh/site-functions
  autoload -Uz compinit && compinit
elif python3 -mplatform | grep -i ubuntu &>/dev/null; then
  export BROWSER=wslview
fi

