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
  # check if the formula is still in the chest
  if ! [ -f "$GSH_CHEST/$(gettext "magic_formula")" ]
  then
    echo "$(gettext "There is no magic_formula in your chest!")"
    return 1
  fi

  # check if the path changed 
  if [ $OLD_PATH = $PATH ]
  then
      echo "$(gettext 'You must change your PATH')"
      return 1

  fi
  if ! $(gettext "magic_formula") -q;
  then
    echo "$(gettext 'The environment variable PATH is not well configured')"
    return 1
  fi
  
 
  # check if no more mouse and a horse
  if  [ -f "$(gettext "$GSH_HOME/Garden/mouse")" ]
  then
    echo "$(gettext "Use your magic formula!")"
    return 1
  fi

  if ! [ -f "$(gettext "$GSH_HOME/Garden/horse")" ]
  then
    echo "$(gettext "Transform the mouse !")"
    return 1
  fi
}
_mission_check
