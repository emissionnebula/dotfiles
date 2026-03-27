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

# Kubectl configs
export PATH="$(brew --prefix)/Cellar/kubernetes-cli/1.26.1/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Gnu tools
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

#JWT decoder
function jwt-decode() {
  jq -R 'split(".") | .[1] | @base64d | fromjson' <<< $1
}



## ok and rok configurations
export FCP_ROOT_DIR="$HOME/git/go/src/github.com/confluentinc/flink-control-plane"
export RM_ROOT_DIR="$HOME/git/go/src/github.com/confluentinc/resource-manager"
export PATH="$PATH":"$FCP_ROOT_DIR"/ok/build
export PATH="$PATH":"$RM_ROOT_DIR"/rok/build

# ok
export FPATH="$FPATH":"$FCP_ROOT_DIR/ok/build/completion"

if command -v "ok" >/dev/null && [[ ! -f "$FCP_ROOT_DIR/ok/build/completion/_ok" ]]; then
  mkdir -p "$FCP_ROOT_DIR/ok/build/completion"

  if comp="$("ok" completion zsh)"; then
    echo "$comp" > "$FCP_ROOT_DIR/ok/build/completion/_ok"
  fi
fi

# rok
export FPATH="$FPATH":"$RM_ROOT_DIR/rok/build/completion"

if command -v "rok" >/dev/null && [[ ! -f "$RM_ROOT_DIR/rok/build/completion/_rok" ]]; then
  mkdir -p "$RM_ROOT_DIR/rok/build/completion"

  if comp="$("rok" completion zsh)"; then
    echo "$comp" > "$RM_ROOT_DIR/rok/build/completion/_rok"
  fi
fi

# tableflow cli
export PATH="/Users/pchauhan/src/cc-unified-storage/bazel-bin/apps/cts/cli:$PATH"

autoload -Uz compinit
compinit

# For claude
export PATH="$HOME/.local/bin:$PATH"
