
awk -v SP='header' -v EP='header' -v cmd=sort '{
if (match($2, SP)>0) {flag=1}
else if (match($2, EP)>0) {
   for (j=0;j<length(a);j++) {print a[j]|cmd}
   close(cmd); delete a; i=0; flag=0}
else if (flag==1) {a[i++]=$0; next}
print $0
}' input_file
