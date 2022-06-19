#!/bin/bash

column -t <(
   paste <(
           find /opt/dev/shell/lib/stack/ -maxdepth 1 -type f -name "*.sh" -printf "%f\n" | sort
         ) \
         <(
           find /opt/dev/shell/lib/stack/ -maxdepth 1 -type f -name "*.txt" -printf "%f\n" | sort
         )
)
