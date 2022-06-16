2022-06-09 10:00:01,000 string1
string2 2022-06-09 10:00:01,000 string2 2022 string2
, string3 string3 string3
2022-06-09 10:00:02,000 string4
string5
]string6 string6 string6
}
2022-06-09 10:00:03,000 string7 string7
2022-06-09 10:00:04,000 string8 string8
2022-06-09 10:00:05,000 string9
#awk 'BEGIN{date=".*([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3})"} {if($0 ~ date) { d=gensub(date,"\\1","g"); gsub(date, "") }{print d,$0}}' dates.sh 
