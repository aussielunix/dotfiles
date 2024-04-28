# You can add your own commands here! For documentation, see: https://ublue.it/guide/just/
import "/usr/share/ublue-os/justfile"

# update tls ca certificate store
update_aussielunix_ca:
  sudo wget --no-check-certificate https://cacert.hl.valueline.io/aussielunix_Root_CA_168848365996868199089383065266162030969.crt --output-document=/etc/pki/ca-trust/source/anchors/aussielunix_Root_CA_168848365996868199089383065266162030969.crt
  sudo /usr/bin/update-ca-trust

# create my daily driver toolbox
mytoolbx:
  #!/usr/bin/env bash
  systemctl --user daemon-reload
  systemctl --user start container-mytoolbx

# Setup and start owncloud distrobox under systemd
owncloud_distrobox:
  #!/usr/bin/env bash
  mkdir -p $HOME/ownCloud/{Personal,Shares}/
  mkdir -p $HOME/.local/share/systemd/user
  rm -rf Downloads && ln -s $HOME/ownCloud/Personal/Workstations/Downloads $HOME/Downloads
  rm -rf Documents && ln -s $HOME/ownCloud/Personal/Workstations/Documents $HOME/Documents
  rm -rf Music && ln -s $HOME/ownCloud/Personal/Workstations/Music $HOME/Music
  rm -rf Videos && ln -s $HOME/ownCloud/Personal/Workstations/Videos $HOME/Videos
  rm -rf Pictures && ln -s $HOME/ownCloud/Personal/Workstations/Pictures $HOME/Pictures
  systemctl --user daemon-reload
  systemctl --user start owncloud-distrobox
  distrobox enter owncloud-desktop-quadlet -- distrobox-export --bin /opt/owncloud-client.AppDir/usr/bin/owncloud --export-path ~/bin/

# Customize Gnome settings
customize_gnome:
  #!/usr/bin/env bash
  set -e
  echo "Installing vim plugins"
  vim +slient +VimEnter +PlugInstall +qall
  echo "Tuning a bunch of Gnome settings with gsettings"
  gsettings set org.gnome.desktop.background picture-uri-dark 'file:///home/lunix/.local/share/backgrounds/2024-02-18-09-27-24-grose_fire05.jpg'
  gsettings set org.gnome.desktop.background picture-uri 'file:///home/lunix/.local/share/backgrounds/2024-02-18-09-27-24-grose_fire05.jpg'
  gsettings set org.gnome.desktop.background primary-color '#000000000000'
  gsettings set org.gnome.desktop.background secondary-color '#000000000000'
  gsettings set org.gnome.desktop.interface clock-show-weekday true
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface show-battery-percentage true
  gsettings set org.gnome.desktop.interface font-hinting 'slight'
  gsettings set org.gnome.desktop.interface font-antialiasing 'grayscale'
  gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 14'
  gsettings set org.gnome.desktop.interface font-name 'Cantarell 14'
  gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 14'
  gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
  gsettings set org.gnome.desktop.notifications application-children "['gnome-power-panel', 'org-gnome-nautilus']"
  gsettings set org.gnome.shell enabled-extensions "['appindicatorsupport@rgcjonas.gmail.com', 'just-perfection-desktop@just-perfection']"
  gsettings set org.gnome.shell disabled-extensions "['background-logo@fedorahosted.org', 'places-menu@gnome-shell-extensions.gcampax.github.com']"
  gsettings set org.gnome.shell.app-switcher current-workspace-only true
  gsettings set org.gnome.desktop.interface enable-hot-corners false
  gsettings set org.gnome.nautilus.preferences migrated-gtk-settings true
  gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/fedora-workstation/petals_light.webp'
  gsettings set org.gnome.desktop.screensaver primary-color '#000000000000'
  gsettings set org.gnome.desktop.screensaver secondary-color '#000000000000'
  gsettings set org.gnome.desktop.wm.preferences num-workspaces 8
  gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 14'
  gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
  gsettings set org.gnome.desktop.search-providers disable-external true
  gsettings set org.gnome.nautilus.window-state maximized true
  gsettings set org.gnome.mutter dynamic-workspaces false
  gsettings set org.gnome.mutter edge-tiling false
  gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.mozilla.firefox.desktop', 'terminator.desktop', 'org.keepassxc.KeePassXC.desktop', 'dev-pod.desktop', 'com.discordapp.Discord.desktop', 'org.tigervnc.vncviewer.desktop', 'code.desktop']"
  gsettings set org.gnome.shell.extensions.just-perfection activities-button false
  gsettings set org.gnome.shell.extensions.just-perfection keyboard-layout false
  gsettings set org.gnome.shell.extensions.just-perfection accessibility-menu false
  gsettings set org.gnome.shell.extensions.just-perfection ripple-box false
  gsettings set org.gnome.shell.extensions.just-perfection weather false
  gsettings set org.gnome.shell.extensions.just-perfection world-clock false
  gsettings set org.gnome.shell.extensions.just-perfection window-demands-attention-focus false
  gsettings set org.gnome.shell.extensions.just-perfection type-to-search false
  gsettings set org.gnome.shell.extensions.just-perfection startup-status 0
  gsettings set org.gnome.shell.extensions.just-perfection workspace-switcher-should-show false
  gsettings set org.gnome.shell.extensions.just-perfection show-apps-button false
  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'My Toolbox'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'terminator -p default -m'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Alt>t'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Silverblue Terminal'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'terminator -p silverblue -m'
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>Return'

