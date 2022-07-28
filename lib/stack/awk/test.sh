echo "
   server {
           listen 80;
           listen [::]:80;

           root /var/www/'${1}'/html;
           index index.html index.php index.htm index.nginx-debian.html;

           server_name "$1
echo -n "           "          
           for i in "${@}"; do echo -n "www.${i} "; done
echo "

           more lines here.
           more
           more
           more

   "
