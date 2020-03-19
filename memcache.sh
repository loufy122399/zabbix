#!/bin/bash
redis_status(){
R_PORT=$1
R_COMMAND=$2
(echo -en "INFO \r\n";sleep 1;) | ncat 127.0.0.1 "$R_PORT" > /tmp/redis_"$R_PORT".tmp
REDIS_STAT_VALUE=$(grep ""$R_COMMAND":" /tmp/redis_"$R_PORT".tmp | cut -d ':' -f2)
echo $REDIS_STAT_VALUE
}
help(){
echo "${0} + redis_status + PORT + COMMAND"
}
main(){
case $1 in
redis_status)
redis_status $2 $3
;;
*)
help
;;
esac
}
main $1 $2 $3

#chmod a+x redis_monitor.sh
# bash redis_monitor.sh redis_status 6379 used_memory

