awk -F/ -v OFS='/' -v h="raw.githubusercontent.com" '$6=="raw" {$3=h;sub(/^raw$/,RS,$6);sub(OFS RS OFS,OFS); print}' urls.txt 
