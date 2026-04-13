#!/usr/bin/env sh

# This file is not required. When it exists, it is used to clean the mission,
# for example on completion, or when restarting it.
# In some rare case, cleaning is different after a successful check. You can
# inspect the variable $GSH_LAST_ACTION, which can take the following values:
# assert, check_false, check_true, exit, goto, hard_reset, reset, skip
# If you need this file, rename it to clean.sh

chest="$(eval_gettext '$GSH_HOME/Forest/Hut/Chest')"
rm -f "$chest"/new_*
rm -f "$(eval_gettext '$GSH_HOME/Forest/magicwand')"
rm -f "$(eval_gettext '$GSH_HOME/Forest/Hut/Chest/magicwand')"
