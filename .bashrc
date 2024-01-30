# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

## User specific environment
#
# add local bin dirs to PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# customize the bash shell behaviour

shopt -s cdspell			# This will fix minor spelling mistakes when using `cd`
complete -cf sudo			# Tab completion when using `sudo`
HISTTIMEFORMAT='%FT%T: '		# timestamps in `.bash_history`
export EDITOR='vim'			# set default editor
export LESS='-R'			# reload file whenever you scroll
export HISTSIZE='5000'			# keep the last 5000 entrie sin `.bash_history`
export HISTIGNORE='pwd:exit:clear'	# leave some things out of `.bash_history`

# User specific bash aliases and functions
if [ -d ~/.profile.d ]; then
  for rc in ~/.profile.d/*.bash; do
    if [ -r "$rc" ]; then
      . "$rc"
    fi
  done
  unset rc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

