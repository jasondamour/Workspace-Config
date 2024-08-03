# Homebrew
if [ -e /opt/homebrew/ ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -e "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
