

awk -i inplace '
    /<programme .* channel=".* \+1"/{prg=1} 
    prg && /<category /{next}
    /<\/programme>/{prg=0}1 
' tv.xml  