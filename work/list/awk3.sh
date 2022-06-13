awk '
   /header/ {
	# Close pipe to sort when we get section header.
        close("sort -r|head -2")
	#close("sort -r|tail -2")
	# Copy the section header line to standard output.
	print
	next
   }
   {	# Feed other lines to sort.
        map[NR] = $0
	print | "sort -r|head -2"
   }' input_file
