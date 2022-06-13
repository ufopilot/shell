



awk '
    FNR == NR {
        for (i=1; i<=NF; i++){
            n=split($(i),a,"/")
            for(x=4; x<=n; x++){
                if (a[x] != "") urls[$(i)][a[x]]
            }
        }
        next
    }
    FNR != NR {
        q=split($0, queries)
    }

    {
      for (i=1; i<=q; i++){
        for (o_url in urls){
          for (qo in urls[o_url] ){
              t_url = o_url
              print t_url " replace " qo " with " queries[i]
              gsub(qo, queries[i], t_url)
              print "result: " t_url 
          } 
        } 
      }
    }

'  urls.lst query.lst