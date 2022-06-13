#!/bin/bash
set -e

#trap 'last_command="$current_command"; current_command="$BASH_COMMAND"' EXIT
trap 'echo "$last_command" command filed with exit code $?."' EXIT
echo
echo ${BASH_COMMAND}
command1
echo $BASH_COMMAND
command2
command3
command_that_is_not_correct
command4
