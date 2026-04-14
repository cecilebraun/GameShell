#!/usr/bin/env sh

# This file is not required: it is sourced every time the mission is started.
# Since it is sourced every time the mission is restarted, it can generate
# random data to make each run slightly different.
#
# Since it is sourced, it may define environment variables if you really need
# them, but it should "unset" any local variable it has created.
#
# Note however that should the mission be initialized in a subshell, those
# environment variables will disappear! That typically happens a mission is
# checked using process redirection, as in
#   $ SOMETHING | gsh check
# To mitigate the problem, GameShell will display a message asking the player
# to run
#   $ gsh reset
# in that case.
#
# It typically looks like
_mission_init() {
  [ -z "$GSH_CHEST" ] && GSH_CHEST="$(eval_gettext '$GSH_HOME/Forest/Hut/Chest')"
  [ -z "$GSH_GARDEN" ] && GSH_GARDEN="$(eval_gettext '$GSH_HOME/Garden')"
  copy_bin  "$MISSION_DIR/../0_shared/magic_formula.sh" "$(eval_gettext '$GSH_HOME/Forest/Hut/Chest/magic_formula')"
  chmod 755 "$GSH_CHEST/magic_formula"

  #init a new mouse
  cp "$MISSION_DIR/../0_shared/ascii_art/mouse.txt" "$(eval_gettext '$GSH_HOME/Garden/mouse')"
  if [ -z "$OLD_PATH" ]
  then 
    echo "no old"
    echo $PATH
    OLD_PATH=$PATH
  fi
}
_mission_init
