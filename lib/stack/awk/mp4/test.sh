#!/bin/bash

    while IFS= read -r file; do 
      if [ ! -f "${file}.mp4" ]; then 
         echo "${file}.mp4" ... ffmpeg_command
      fi 
    done < <(find . -iname "*.mxf"|sed 's/\.mxf$//')
