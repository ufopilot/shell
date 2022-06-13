with open ('app_script.sh', 'w') as appscript:
    appscript.write('''\
#!/bin/sh
set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' INT
trap 'echo "$last_command" command filed with exit code $?."' EXIT

command1
command2
command3
command_that_is_not_correct
command4
''')