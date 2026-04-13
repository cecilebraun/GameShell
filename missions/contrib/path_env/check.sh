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
  #check if the magic formula is in the chest
  
  if ! [ -f "$GSH_CHEST/$(gettext "magic_formula")" ]
  then
    echo "$(gettext "There is no magic_formula in your chest!")"
    return 1
  fi
  #check the execute permission of the magic formula
  if ! [ -x "$GSH_CHEST/$(gettext "magic_formula")" ]
  then
    echo "$(gettext "The magic_formula is not usable")"
    return 1
  fi
  #check if you transform your shoes
  if ! [ -f $(gettext '$GSH_HOME/Forest/Hut/Chest/new_shoes') ]
  then
    echo "$(gettext "There is no new shoes chest!")"
    return 1
  fi
  return 0
}
_mission_check
