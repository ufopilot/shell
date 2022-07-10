 #!/bin/bash
 DATA_DIR=./data 
 find "${DATA_DIR}" -mindepth 1 -type d -exec bash -c '
        echo "Will convert in the following folder: {}";  
        echo convert "{}"/*.{jpg,JPG,png,PNG,jpeg,JPEG,bmp,BMP} "{}".pdf 
' \;