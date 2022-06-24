# put file content to array
readarray -t foldersArray < tmp/folders.txt 
# 1. find all files in multiple folders using array
readarray -t resultArray < <(find "${foldersArray[@]}" -name "*.jpg")
# 2 . using loop. Iterate through result array values 
for img in "${resultArray[@]}"; do 
    echo  "found $img"
done    

exit   
    echo "---------------------------------------------"
    # 2 . using loop. Iterate through array values 
    for folder in "${foldersArray[@]}"; do 
        find "$folder" -name "*.jpg" 
    done    
