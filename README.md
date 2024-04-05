# workstartion-config
A collection of scripts to get a new workstation configured

## Usage
Install Brew and Git
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

Clone Repo
```
git clone git@github.com:jasondamour/Workspace-Config.git
```

Execute setup.sh with zsh context
```
export ZSH_CUSTOM && ./setup.sh
```

Link `.zshrc`
```
ln -s ~/Workspace/Personal/Workspace-Config/.zshrc ~/.zshrc
```
