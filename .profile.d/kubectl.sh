# setup autocomplete in bash into the current shell
source <(kubectl completion bash)

# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
export USE_GKE_GCLOUD_AUTH_PLUGIN="True"

# From https://kubernetes.io/docs/reference/kubectl/cheatsheet/
alias k="kubectl"
complete -o default -F __start_kubectl k

alias kx="kubectx"
alias kn="kubens"
