
source <(~/bin/kubectl completion bash)

alias k='kubectl '
complete -o default -F __start_kubectl k


export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(~/bin/kubectl krew completion bash)

function kgall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl get --ignore-not-found ${i} -A
    #kubectl -n monitoring get --ignore-not-found ${i}
  done
}

alias kge="k get events --sort-by='.metadata.creationTimestamp' "
alias kga='k get all,svc,secrets,cm,ing '
alias kgp='k get pods '
