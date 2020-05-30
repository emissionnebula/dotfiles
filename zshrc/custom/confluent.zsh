# CCloud dotfiles and environment scripts
source ~/git/go/src/github.com/confluentinc/cc-dotfiles/caas.sh
#. /Users/pchauhan/workspace/confluentinc/cc-dotfiles/caas.sh

# CAAS SSH ENV
export AWS_DEFAULT_REGION=us-west-2
export CAAS_USER=pchauhan
export OKTA_DEVICE_ID=opf3ks3xdqbglN9Zy357

# pint autocompletion
eval "$(_PINT_COMPLETE=source $(which pint))"

