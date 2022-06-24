#!/bin/bash

# getting UID
uid=$(id -u)

# verification of the UID
[ "$uid" -ne 0 ] && { echo "only root can excute this script"; exit 1; }

if [ "$1" ]
then
    fichier="$1"
else 
    read -r -p "enter file name : " fichier
fi

# verification of the existence of the file 
if [ -f "$fichier" ]
then
    while IFS=" " read -r user  psw group
    do
       echo "USR: $user  PSW : $psw  GROUP: $group"
       if [ "$group" != "-" ];
       then
            if getent group "$group" &>/dev/null
            then
               echo "le groupe $group existe "
            else 
               echo "create group $group"
               /usr/sbin/groupadd "$group"
            fi

            if id -u "$user" &>/dev/null
            then
               echo "user $user exist  "
               echo "add $user to group $group"
               usermod -a -G "$group" "$user"
            else
               echo "create user $user"
               /usr/sbin/useradd -m -g "$group" "$user"
               echo "set password ***** for $user"
               echo -e "${psw}\n${psw}" | passwd "$user"
            fi
       else
           echo -e "\n****"
           source="/home/ensem/Bureau"
           dest="/archives"
           nom_archive="${user}-$(date +%Y%m%d%H%M%S).tar.gz"
           echo "Backup the files from $source a ${dest}/${nom_archive}"
           tar -czf "${dest}/${nom_archive}" "${source}"
           echo "Fin d'archivage"
           ls -lh "$dest"
       fi
    done < "$fichier"
else 
    echo "file $fichier doesn't exist!"
fi

#grep https://stackoverflow.com/questions/72746959/back-up-files-using-a-shell-script