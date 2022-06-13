awk '
FNR == NR{
  arr1[$3]=$0
  next
}
($3 in arr1){
  split(arr1[$3],arr2)
  print (arr2[1]"-"$1,arr2[2]"-"$2,$3)
  delete arr2
}
' 1.txt 2.txt
