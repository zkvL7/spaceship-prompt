# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# TODO: Let sections register their own hooks via `spaceship::register_hook`

# Execution time start
spaceship_exec_time_preexec_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  SPACESHIP_EXEC_TIME_start=$(date +%s)
}

# Execution time end
spaceship_exec_time_precmd_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return
  local SPACESHIP_EXEC_TIME_stop=$(date +%s)
  SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_stop - $SPACESHIP_EXEC_TIME_start ))
  unset SPACESHIP_EXEC_TIME_start
}

# vcs_info hook
spaceship_exec_vcs_info_precmd_hook() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return
  vcs_info
}

# Custom hooks for cmd timestamp
spaceship_cmd_timestamp_preexec_hook() {
  [[ $SPACESHIP_CMD_TIMESTAMP_SHOW == false ]] && return
  
  local 'SPACESHIP_CMD_TIMESTAMP_start'
  if [[ $SPACESHIP_CMD_TIMESTAMP_FORMAT != false ]]; then
    SPACESHIP_CMD_TIMESTAMP_start="${SPACESHIP_CMD_TIMESTAMP_FORMAT}"
  else
    SPACESHIP_CMD_TIMESTAMP_start="%D{%c}"
  fi

  print -P "%F{$SPACESHIP_CMD_TIMESTAMP_COLOR}$SPACESHIP_CMD_TIMESTAMP_PREFIX_START$SPACESHIP_CMD_TIMESTAMP_start$SPACESHIP_CMD_TIMESTAMP_SUFFIX_START%f"
}

spaceship_cmd_timestamp_precmd_hook() {
  [[ $SPACESHIP_CMD_TIMESTAMP_SHOW == false ]] && return

  local 'SPACESHIP_CMD_TIMESTAMP_end'
  if [[ $SPACESHIP_CMD_TIMESTAMP_FORMAT != false ]]; then
    SPACESHIP_CMD_TIMESTAMP_end="${SPACESHIP_CMD_TIMESTAMP_FORMAT}"
  else
    SPACESHIP_CMD_TIMESTAMP_end="%D{%c}"
  fi
  
  print -P "%F{$SPACESHIP_CMD_TIMESTAMP_COLOR}$NEWLINE$SPACESHIP_CMD_TIMESTAMP_PREFIX_END$SPACESHIP_CMD_TIMESTAMP_end$SPACESHIP_CMD_TIMESTAMP_SUFFIX_END%f"
}
