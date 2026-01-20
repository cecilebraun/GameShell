#!/usr/bin/env sh

# This file is required. It is sourced when checking the goal of the mission
# has been achieved.
# It should end with a command returning 0 on success, and something else on
# failure.
# It should "unset" any local variable it has created, and any "global
# variable" that were only used for the mission. (The function _mission_check
# is automatically unset.)
#
# It typically looks like

_mission_check() {
  garden_path="$(gettext "$GSH_HOME/Garden/Flower_Garden")"
  cat $MISSION_DIR/ascii-art/squirrel.txt
  printf "%s " "$(gettext "What the complete adress of this garden ?")"
  read -r response

  #Check if ~ has been used

  if  echo "$response" | grep -q "~"
  then
    echo "$(eval_gettext "Do not use the '~' symbol, it is a shortcut.")"
    return 1
  fi
  # If the last character is / add to the correct answer
  if [[ "${response: -1:1}" = "/" ]]
  then
    garden_path=$garden_path"/"
  fi

  if [ "$response" != "$garden_path" ]
  then
    echo "$(eval_gettext "That's not the right path ...")"
    return 1
  fi
  return 0
}
_mission_check
