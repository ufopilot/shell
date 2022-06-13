awk '
        BEGIN {
          printf "Enter degree celsius temperature: "
          getline c < "-" 
          #print c
          printf("The temperature in Fahrenheit is %.2f\n", 1.8 * c + 32)
        }
        
' 

#awk -v c="$c" 'BEGIN {printf("The temperature in Fahrenheit is %.2f\n", 1.8 * c + 32)}'