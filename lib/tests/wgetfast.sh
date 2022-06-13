awk -F/ -v target_path="." '
    function dirname(file){
        split(file, a, ".")
        gsub("_chr", "", a[1])
        return a[1] 
    }

    function mkdir(dir){
        print |"mkdir -p " dir
    }

    function wget(url, file, dir){
        print |"wget " url " -O " dir"/"file 
        return 0
    }
    
    function blast(file, dir){
        print |dir"/crb-blast -q "file" -t TCV2_annot_cds.fna -e 1e-20 -h 4 -o rbbh_TC"
    }

    {
        dir=target_path"/"dirname($NF)
        mkdir(dir)
        wget($0, $NF, dir)
        blast($NF, dir) 
    }
' fastfiles.txt