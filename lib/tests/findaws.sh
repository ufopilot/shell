#!/bin/bash
PROG=awss
LOCATION=$(find ~/ -name "$PROG")
if [ -n "$LOCATION" ]; then 
   PROG_DIR=$(dirname "$LOCATION")
   if ! echo $PATH|grep -q "${PROG_DIR}"; then 
	echo  "${PROG_DIR} not in PATH"
        echo  "adding export PATH=\$PATH:${PROG_DIR} to .bashrc" 
        if grep -q "export PATH" ~/.bashrc 2>/dev/null; then 
	      sed -i "/export PATH/a export PATH=\$PATH:${PROG_DIR}" ~/.bashrc 
        else
              echo  "export PATH=\$PATH:${PROG_DIR}" > ~/.bashrc
        fi
        echo "execute . ~/.bashrc or open a new console"
	
   else
      $PROG --version 2>/dev/null
   fi
else
   echo "$PROG not found"
fi
