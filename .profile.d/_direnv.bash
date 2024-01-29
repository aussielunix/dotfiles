# get direnv up and running
#
if [[ -n "$CONTAINER_ID" ]]; then
  eval "$(direnv hook bash)"
fi
