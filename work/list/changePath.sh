awk -F, -v level="2" '
  function dirname(f,l) {
    s = ""; n=split(f,a,"/");
    for (i=2; i<=n-l; i++) {  s = s "/" a[i] } 
    return s
  }
  function basename(f) {
    n=split(f,a,"/");return a[n]
  }
  BEGIN{ OFS=FS }
  {$1=basename($1); $2=" "$2}1
' input_file2 
