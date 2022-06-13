


 awk '
      {
	$2=""; 
        gsub(/.$/,"",$1)
        if ($1 > g) {

	}else{

	} 
}' <(du -sh /opt)
