awk -F="\t" ' 
    NR==1{
        $(NF+1)="GPUAllocated"
    }
    NR>1{
        $(NF+1)="\t" 0
    } 
    /gres\/gpu=/{
        split($0, a, "=")
        gp=a[3]; gsub(/[ ,].*/, "", gp)  
        $NF="\t" gp  
    }
    1' test.text 
