## Env settings

# JEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# goenv for managing Go versions
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

