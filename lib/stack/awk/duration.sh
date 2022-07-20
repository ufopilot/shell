awk -F '[\\[\\]=,]' '/TaskManager/{tsp=$2}/duration/{print tsp"\t"$5}' duration
awk -v RS= -F'[][,=]+' '$0=$2"\t"$7' duration
# awk -F '[=,]' ' 
#     /duration=/{
#         printf "%s.%s\t%s\n",strftime("%d.%m.%y %H:%M:%S",$7/1000,1),substr($7,length($7)-2),$5
# }' duration 

#awk -F '[\\[\\]=,]' '$4==" duration"?$0=strftime("%d.%m.%y %H:%M:%S",$7/1000,1)"."substr($7,length($7)-2)"\t"$5:""' duration
# awk -F '[=,]' '
#     /duration=/{
#         printf "%s.%s\t%s\n", 
#             strftime("%d.%m.%y %H:%M:%S", $7/1000, 1),
#             # convert Timestamp to date
#             substr($7,length($7)-2),$5
#             substr($7,4,3)
#             # add miliseconds & duration
# }' duration 

#strftime("%d.%m.%y %H:%M:%S", substr($7,1,length($7)-3),1),
            
