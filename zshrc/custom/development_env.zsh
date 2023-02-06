## Env settings

# JEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Tell goenv where the GOPATH prefix is for all go versions
export GOENV_GOPATH_PREFIX=$HOME/git/go

# Setup and Init goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"



godevenv() {
  # Tell goenv where the GOPATH prefix is for all go versions
  export GOENV_GOPATH_PREFIX=$HOME/git/go
  go version
}

# Custom binaries
export PATH="$HOME/bin:$PATH"


# PYENV settings
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Google SDK configs
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc


# Kubectl congigs
export PATH="$(brew --prefix)/Cellar/kubernetes-cli/1.26.1/bin:$PATH"


# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
