vina=/home/x/xxx/bin/vina
path=/home/x/xxx/Virtual_Screening

# Execute the job code

for f in $path/*.pdbqt;do
    $vina --config $path/BatchConfig.txt --receptor $path/5u1w_receptor.pdbqt --batch $path/ligands/*.pdbqt --dir $path/outputs/001
done
