#!/usr/bin/env sh
. gsh_gettext.sh

SHARED="$MISSION_DIR/../0_shared"
main() {
    # Not the right number of args
    if [ "$#" -ne 1 ]
    then
        cmd_name=$(basename "$0")
        msg=$(gettext 'Error: %s takes one argument.')
        printf "$msg\n" "$cmd_name" >&2
        return 1

    fi
 
  if [ $1 = "-q" ]
  then
    return 0
  fi
  # File in arg not found
  if [ ! -f $1 ]
  then
    msg=$(gettext 'Error: file %s not found.')
    printf "$msg\n" "$1" >&2
    return 1
  fi
  file_name=$(basename "$1")
  if [ $file_name = $(gettext "old_shoes") ]
  then
    cat "$SHARED/ascii_art/magicwand.txt"
    tput bel
    cp "$SHARED/ascii_art/new_shoes.txt" $(gettext "new_shoes")
    rm "$1"
    return 0
  fi
  if [ $file_name = $(gettext "new_shoes") ]
  then
    cat "$SHARED/ascii_art/magicwand.txt"
    tput bel
    cp "$SHARED/ascii_art/old_shoes.txt" $(gettext "old_shoes")
    rm "$1"
    return 0
  fi
  if [ $file_name = $(gettext 'mouse') ]
  then
    cat "$SHARED/ascii_art/magicwand.txt"
    tput bel
    cp "$SHARED/ascii_art/horse.txt" $(gettext "horse")
    rm "$1"
    return 0
  fi
  if [ $file_name = $(gettext 'horse') ]
  then
    cat "$SHARED/ascii_art/magicwand.txt"
    tput bel
    cp "$SHARED/ascii_art/mouse.txt" $(gettext "mouse")
    rm "$1"
    return 0
  fi

  cat "$SHARED/ascii_art/magicwand.txt"
  tput bel
  mv "$1" "new_$1"
  
  return 0  


}
main "$@"
