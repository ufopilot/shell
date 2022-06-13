#awk '/\[code\]/{flag=1}/\[\/code\]/{flag=0}flag' input_file
#sed -n '/\[code\]/,/\[\/code\]/p' input_file | sed '/\[.*code\]/d'
awk -v fpath="/tmp" \
    -v fname="File" \
    -v fext="txt" '
    /\[code\]/{flag=1; i++; file=fpath"/"fname i "."fext; next}
    /\[\/code\]/{flag=0; next}
    {
        if (flag==1){
            print $0 > file
        }
    }
    ' input_file

# awk '
# /^\[code\]/   { outfile="/home/user/split/File" ++i ".txt"; next }
# /^\[\/code\]/ { close(outfile); outfile=""; next }
# outfile       { print > outfile }
# ' bigfile.nfo