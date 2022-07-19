
awk  -v search="^firmware_version .*" \
     -v replace="firmware_version 12.5" \
     -v start="somes text" \
     -v end="some more text"  '
    start, end{
        #if (c){f=sub(search,replace)}
        if ($0 ~ end) {printf "%s", (!f ? replace "\n" : "")}
    }1   
' versions.txt 

exit
awk  -i inplace \
     -v search="^firmware_versions .*" \
     -v replace="firmware_version 12.5" '
    !f{f=sub(search,replace)}
    ENDFILE{print(!f ? replace : "")}
' versions.txt 

exit
$ sed -n -i -e '/^firmware_version /!p' -e '$afirmware_version 12.xx' append.txt 
$ sed -e '$a\' -e '<your-entry>' -e "/<your-entry-properly-escaped>/d"
