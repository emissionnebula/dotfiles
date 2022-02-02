# CCloud dotfiles and environment scripts
export CC_DOTFILES_BETA=true
source ~/git/go/src/github.com/confluentinc/cc-dotfiles/caas.sh
source ~/git/go/src/github.com/confluentinc/cc-dotfiles/include/cost-ga/ccbq.sh
#. /Users/pchauhan/workspace/confluentinc/cc-dotfiles/caas.sh

# CAAS SSH ENV
export AWS_DEFAULT_REGION=us-west-2
export CAAS_USER=pchauhan
export OKTA_DEVICE_ID=opfcu76ji1n8fCtb3357

# pint autocompletion
#eval "$(_PINT_COMPLETE=source $(which pint))"

# halyard
export PATH=${PATH}:/Users/pchauhan/git/go/src/github.com/confluentinc/halyard/bin
alias halprod='halctl --context prod --vault-oidc-role halyard-prod --vault-token $(cat ~/.vault-token) --vault-login-path auth/app/prod/login'
alias halcpd='halctl --context cpd --vault-oidc-role halyard-devel --vault-token $(cat ~/.vault-token) --vault-login-path auth/app/devel/login'

# vault addr
export VAULT_ADDR=https://vault.cireops.gcp.internal.confluent.cloud

