awk '
    BEGIN{RS = "\r?\n"; FS = ","; OFS = FS}
    NR == 1 {$10 = "S_Perc"}
    NR == 1 {$11 = "N_I_Perc"} 
    NR > 1 {
        $9 = sprintf("%0.2f",$9)
        $10 = ($5+0==$5 && $6+0==$6 && $3+0==$3) ? sprintf("%0.2f",(($5-$6)/$3)*100) : "N/A"
        $11 = ($5+0==$5 && $6+0==$6 && $3+0==$3) ? sprintf("%0.2f",(($3-$5)/$3)*100) : "N/A"
    }END{
        print > "file.csv"
  }' grep_data.txt