<?php
#shell_exec("php ~/acmephp.phar request  --country AO --province Malanje --locality 'Western Cape' --organization Private --unit technology --email myemail@mail.com example1.com");
shell_exec("php ~/acmephp.phar request --country='AO' --province='Malanje' --locality='Western Cape' --organization='private' --unit='technology' --email='myemail@mail.com' example1.com -a example2.com -a example3.com ");

//--locality=''Western Cape'

Passing current PATH to root with
`sudo -E env "PATH=$PATH" ./xtest.sh`
You can create an alias or a function in .bashrc
alias sudo='/usr/bin/sudo -E env "PATH=$PATH"'
function sudo(){ /usr/bin/sudo -E env "PATH=$PATH" "$@"; }


