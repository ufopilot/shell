echo -e "http://sub.domain.tld/secured/database_connect.php\nhttp://sub.domain.tld/section/files/image.jpg\nhttp://sub.domain.tld/.git/audio-files/top-secret/audio.mp3" | 
awk 'match($0,/.*\//,a){print a[0]}'
echo -e "http://sub.domain.tld/secured/database_connect.php\nhttp://sub.domain.tld/section/files/image.jpg\nhttp://sub.domain.tld/.git/audio-files/top-secret/audio.mp3" | 
awk '{print gensub(/(.*\/).*/,"\\1",1)}'
echo -e "http://sub.domain.tld/secured/database_connect.php\nhttp://sub.domain.tld/section/files/image.jpg\nhttp://sub.domain.tld/.git/audio-files/top-secret/audio.mp3" | 
awk -F/ 'sub($NF,"")'
echo -e "http://sub.domain.tld/secured/database_connect.php\nhttp://sub.domain.tld/section/files/image.jpg\nhttp://sub.domain.tld/.git/audio-files/top-secret/audio.mp3" | 
awk 'sub(/[^/]*$/,"")'
echo -e "http://sub.domain.tld/secured/database_connect.php\nhttp://sub.domain.tld/section/files/image.jpg\nhttp://sub.domain.tld/.git/audio-files/top-secret/audio.mp3" | 
xargs -i sh -c 'echo $(dirname "{}")/'

