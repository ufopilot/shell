#!/bin/bash 

cat << ==EOF==
BASH                       $BASH                  
BASH_ALIASES               $BASH_ALIASES         
BASH_ARGC                  $BASH_ARGC                
BASH_ARGV                  ${BASH_ARGV[@]}                
BASH_ARGV0                 $BASH_ARGV0            
BASH_CMDS                  $BASH_CMDS  
BASH_COMMAND               \$BASH_COMMAND            
BASH_COMPLETION_VERSINFO   $BASH_COMPLETION_VERSINFO
BASH_ENV                   $BASH_ENV                
BASH_LINENO                $BASH_LINENO             
BASHOPTS                   $BASHOPTS     
BASHPID                    $BASHPID      
BASH_REMATCH               $BASH_REMATCH 
BASH_SOURCE                $BASH_SOURCE  
BASH_SUBSHELL              $BASH_SUBSHELL
BASH_VERSINFO              $BASH_VERSINFO
BASH_VERSION               $BASH_VERSION

==EOF==