
#!/bin/bash

for i in {001..100}; do 
    cp script.sh "script_$i.sh" && sed -i "s/001$/$i/" "script_$i.sh"
done