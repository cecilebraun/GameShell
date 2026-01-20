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
  castle="$(eval_gettext '$GSH_HOME/Castle')"
  flower_garden="$(eval_gettext '$GSH_HOME/Garden/Flower_Garden')"
  lady_squirrel="$(eval_gettext 'Lady_Squirrel')"
  current=$(readlink-f "$PWD")
  garden="$(eval_gettext 'Garden')"
  # check that you are still in the castle
  if [ "$castle" != "$current" ]
  then
    echo "You are not in the castle anymore ..."
    return 1
  fi
  # Check that Lady Squirel is not in the castle anymore.
  if [ -f "$castle/$lady_squirrel" ]
  then
    echo "$(eval_gettext "Lady Suqirrel is still in the castle !")"
    return 1
  fi
  # Check that Lady Squirel is in the flower garden.
  if [ ! -f "$flower_garden/$lady_squirrel" ]
  then
    echo "$(eval_gettext "Lady Suqirrel is not in the flower garden !")"
    return 1
  fi
  # check the lady.
  if ! check_file "$flower_garden/$lady_squirrel"
  then
    echo "$(eval_gettext "Lady squirrel is not the same as she used to...")"
    return 1
  fi
  pc=$(. fc-lnr.sh | head -n1)
  if ! echo "$pc" | grep -q "\.\."
  then
    echo "$(eval_gettext "The path in your command should start with ..")"
    return 1
  fi

  return 0
}
_mission_check
