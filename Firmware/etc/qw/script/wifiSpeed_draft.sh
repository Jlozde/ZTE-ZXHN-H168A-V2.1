#!/bin/sh

  download_bin_path=$1       # Pass URL parameter from TR-069 as first command line parameter to script
  key=$2                     # Pass KEY parameter from TR-069 as second command line parameter to script
  certs_path="/etc/qw/certs"                                 
  echo "<-- Starting Script --> "
  count=0
  while [ 1 ]; do
    delay_base=5
    downloaded=0
    sleep 1
    pids=$(pidof wifiSpeed)
    if [ $pids ]
    then 
        echo "\n Killing wifiSpeed with pid:"$pids
        kill -9 $pids
    fi

    while [ $downloaded -eq 0 ]; do 
         rm -f /tmp/wifiSpeed 
         rm -f /tmp/wifiSpeed.sign
         if [ $delay_base -lt 1000 ] 
         then  
          delay_base=`expr $delay_base \* 2`   
#         let delay_base=$(( 2*$delay_base ))
         fi 
         random_number=$(head /dev/urandom | tr -dc "123456789" | head -c2)
         random_delay=`expr $random_number + $delay_base`
#         let random_delay=$(( $(($random_number)) + $delay_base))
         echo "\n... entering into sleep mode for $random_delay seconds \n" 
         download_signature_path=$download_bin_path".sign"
         sleep  $random_delay && \
         curl --max-filesize 1M --max-time 60 --cacert $certs_path/maynun-ca.crt $download_bin_path --output /tmp/wifiSpeed && \
         curl --max-filesize 500B --max-time 10 --cacert $certs_path/maynun-ca.crt $download_signature_path --output /tmp/wifiSpeed.sign && \
         openssl dgst -verify $certs_path/agent.pub -keyform PEM -sha256 -signature /tmp/wifiSpeed.sign -binary /tmp/wifiSpeed && \
#         ./qwutil verify --key agent.pub --signature /tmp/wifiSpeed.sign --binary /tmp/wifiSpeed && \
         rm -f /tmp/wifiSpeed.sign && \
         chmod +x /tmp/wifiSpeed && \
         echo "\n... VERIFIED OK" && \
         downloaded=1;
     done 
#     count=`expr $count + 1` && \ 
     let count=$(( $count + 1 )) && \
     echo "\n... running wifiSpeed #:"$count && \
     param=$key /tmp/wifiSpeed; \
  done 