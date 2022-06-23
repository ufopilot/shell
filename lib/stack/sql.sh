#!/bin/bash
trap db_cleaner EXIT
db_cleaner(){ rm -f "mydb$$"; }

IPS=ips.txt
DOMAINS=domains.txt
#-----------------------------------------
sqlite3 -csv -separator " " mydb$$ ".import ${IPS} ip_table"
sqlite3 -csv -separator " " mydb$$ ".import ${DOMAINS} domain_table"
sqlite3 mydb$$ -separator " "  "SELECT a.IP, b.DOMAIN, COUNT(*) FROM ip_table a, domain_table b where a.IP=b.IP GROUP BY a.IP;"
