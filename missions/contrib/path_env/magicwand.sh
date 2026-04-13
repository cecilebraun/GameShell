#!/usr/bin/env sh
. gsh_gettext.sh


main() {
    # Not the right number of args
    if [ "$#" -ne 1 ]
    then
        cmd_name=$(basename "$0")
        msg=$(gettext 'Error: %s takes one argument.')
        printf "$msg\n" "$cmd_name" >&2
        return 1

    fi
  # FIle in arg not found
  if [ ! -f $1 ]
  then
    msg=$(gettext 'Error: file %s not found.')
    printf "$msg\n" "$1" >&2
    return 1
  fi
  file_name=$(basename "$1")
  if [ $file_name = "old_shoes" ]
  then
    cat "$MISSION_DIR/ascii_art/magicwand.txt"
    tput bel
    cp "$MISSION_DIR/ascii_art/new_shoes.txt" "$(eval_gettext '$GSH_HOME/Forest/Hut/Chest/new_shoes')"
    rm "$1"
    return 0
  else
    cat "$MISSION_DIR/ascii_art/magicwand.txt"
    tput bel
    mv "$1" "new_$1"
  fi


}
main "$@"
