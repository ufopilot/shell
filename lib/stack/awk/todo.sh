quelleEtage(){
    awk '
        /R.738067/ { print 0; exit     }
        /T525110/  { print -1; exit    } 
        /402276/   { print 1; exit    }
        /309871/   { print 2; exit     }
        /AF797033/ { print 0; exit     }
        /T520224/  { print Common; exit}
        { print -3 }
    ' todo.dat
}

Etage=$(quelleEtage)
echo "Etage: $Etage"

if [ "$Etage" = "-3" ]; then 
    echo "Pas un compteur electricite correct"
fi
#/ectricite correct"; Etage=-3;