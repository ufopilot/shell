#!/bin/bash

usage(){ 
            echo "Usage: $0 PUBKEY HOST_IP PORT" 
            echo " PUBKEY         add key file PUBKEY (default: $PUBKEY)"
            echo " PORT           add key to container running on port PORT (default: $PORT)"
            echo " HOST_IP        connect to host HOST_IP (default: $HOST_IP"
}
PORT=xxx PUBKEY=xxx HOST_IP=xxx
    
[[ "$1" = "-h" || "$1" = "--help" ]] && { usage; exit; }
echo ssh-copy-id -i "$HOME/.ssh/${1-$PUBKEY}" "root@${2-$HOST_IP}" -p "${3-$PORT}"
