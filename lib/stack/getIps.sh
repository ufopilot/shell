

awk '
    {
        $1 ~ /\./ ? $0 = $1 \
            : 
            ( \
                $2 ~ /\./ ? $0 = $2 \
                    : \
                    $0 = "NO_IP_Found" \
            )
    }1
' <(paste FILE1 FILE2)

#awk '{print( $1~/\./?$1:($2~/\./?$2:"NO_IP_Found"))}' <(paste FILE1 FILE2)
