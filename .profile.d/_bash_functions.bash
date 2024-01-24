# Bash functions definitions.
#

# recursive search for string in filenames
#
ff () {
        find . -name "*$@*" -print;
}

# recursive search for string inside of files
#
fff () {
  find . -type f -print0 | xargs -0 grep -l $@
}

## Generate a short "random" string
#
suuid () {
  uuidgen | awk -F '-' '{ print $2 }'
}

#####################
# extract files
# eg: ex tarball.tar
#####################
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar vxjf $1        ;;
      *.tar.gz)    tar vxzf $1     ;;
      *.bz2)       bunzip2 $1       ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar vxf $1        ;;
      *.tbz2)      tar vxjf $1      ;;
      *.tgz)       tar vxzf $1       ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# run /bin/ps without a bunch of system processes
pss() {
  if [ -z "$@" ]; then
    ps -fHN --ppid 2 -C init,kthread,firefox-bin
  else
    ps -fHN --ppid 2 -C init,kthread,firefox-bin | grep "$@"
  fi
}
