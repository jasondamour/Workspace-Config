if python3 -mplatform | grep -i macos &>/dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi
