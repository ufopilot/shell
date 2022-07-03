awk '
  NR==1{
    printf "%-16s | %-9s | %s\n", "Date","Weekday","Shift"; next   
  }
  {
    "date -d \"" $0 "\" \"+%d-%m-%Y %H:%M | %A\"" | getline d
    gsub(/:/, "", $2); t=int($2)
    printf "%-28s | %s\n", d ,(t > 73000 && t < 193000) ? "Morning" : "Night"
  }' tm.txt