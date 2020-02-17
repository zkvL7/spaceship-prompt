#
# command timestamps
#
# Display the timestamp for an issued command.
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CMD_TIMESTAMP_SHOW="${SPACESHIP_CMD_TIMESTAMP_SHOW=false}"
SPACESHIP_CMD_TIMESTAMP_FORMAT="${SPACESHIP_CMD_TIMESTAMP_FORMAT=false}"
SPACESHIP_CMD_TIMESTAMP_COLOR="${SPACESHIP_CMD_TIMESTAMP_COLOR="015"}"

SPACESHIP_CMD_TIMESTAMP_PREFIX_START="${SPACESHIP_CMD_TIMESTAMP_PREFIX_START="┌─[ "}"
SPACESHIP_CMD_TIMESTAMP_SUFFIX_START="${SPACESHIP_CMD_TIMESTAMP_SUFFIX_START=" - Start ]"}"
SPACESHIP_CMD_TIMESTAMP_PREFIX_END="${SPACESHIP_CMD_TIMESTAMP_PREFIX_END="└─[ "}"
SPACESHIP_CMD_TIMESTAMP_SUFFIX_END="${SPACESHIP_CMD_TIMESTAMP_SUFFIX_END=" - End   ]"}"

# ------------------------------------------------------------------------------------------------
# Section
# Since it`s not properly a section within the prompt all is printed through the associated hooks
# ------------------------------------------------------------------------------------------------

spaceship_cmd_timestamp() {
  [[ $SPACESHIP_CMD_TIMESTAMP_SHOW == false ]] && return
}
