source ./csvsql
# ------------------------------------------------------------
echo ip > csv.tmp
cat ips.csv >> csv.tmp
csql -i -f ./csv.tmp -t mytable
csql -s " " -e "SELECT ip, COUNT(*) FROM mytable GROUP BY ip;"
rm csv.tmp
