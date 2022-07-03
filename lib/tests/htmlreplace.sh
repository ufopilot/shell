$ cat html
<h3 class="indicate-hover css-5fzt5q">For the Most Complex Heroines Animation
<h3 class="indicate-hover css-1pvrrwb">The Psychology Behind Sibling

$ awk -F '>|<' '/indicate-hover css-/{print "head", $3}' html
head For the Most Complex Heroines Animation
head The Psychology Behind Sibling

# multiple classes
awk -F '>|<' '/indicate-hover css-|summary-class css-/{print "head", $3}' html

# all classes
$ awk -F '>|<' '/class=".* css-.*"/ {print "head", $3}' html
head For the Most Complex Heroines Animation
head The Psychology Behind Sibling
head How many words can
Inplace:

$ awk -F '>|<' -i inplace '/indicate-hover css-/{print "head", $3}' html
$ cat html
head For the Most Complex Heroines Animation
head The Psychology Behind Sibling