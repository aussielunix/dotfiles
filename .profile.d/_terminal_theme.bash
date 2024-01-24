
# sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh

if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

	# Optional

	#Binds C-o to the previously active theme.
	#bind -x '"\C-o":"theme.sh $(theme.sh -l|tail -n2|head -n1)"'

	alias th='theme.sh -i2'

	# Interactively load a light theme
	alias thl='theme.sh --light -i2'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i2'

  # immediatley change to a random dark theme
  alias thr='INHIBIT_THEME_HIST=1 theme.sh --dark -r'
fi
