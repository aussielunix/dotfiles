

# User specific bash aliases and functions
if [[ -n "$CONTAINER_ID" ]]; then
  if [ -d $HOME/.local/share/bluefin-cli/.linuxbrew/etc/bash_completion.d ]; then
    for rc in $HOME/.local/share/bluefin-cli/.linuxbrew/etc/bash_completion.d/*; do
      if [ -r "$rc" ]; then
        . "$rc"
      fi
    done
    unset rc
  fi
fi
