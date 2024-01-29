
if [[ -n "$CONTAINER_ID" ]]; then
  alias k='kubectl '
  complete -o default -F __start_kubectl k

  function kgall {
    for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
      echo "Resource:" $i
      kubectl get --ignore-not-found ${i} -A
    done
  }

  alias kge="k get events --sort-by='.metadata.creationTimestamp' "
  alias kga='k get all,svc,secrets,cm,ing '
  alias kgp='k get pods '
fi
