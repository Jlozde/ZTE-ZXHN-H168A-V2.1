#!/bin/sh

if [[ "$1" == "--help" ]];
then
   echo "Please type in:$0 'wlanx' 'FID'."
   echo "'wlanx' is the wlan interface, 'wlanx' default is wlan5g0."
   echo "'FID',if have Blocked message, type in decimal fid"
   exit 1
fi

WLAN_STR=wlan5g0

case "$1" in
"wlan"*)
    WLAN_STR=$1;;
esac

echo "-----------Strat get $WLAN_STR NoBeacon information-------------"
iwpriv $WLAN_STR set Debug=2
for i in 1 2 3
do
    iwpriv $WLAN_STR set ShowDfsRDMode=1
done

iwconfig
ifconfig
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR stat
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show mibinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show trinfo
done
#for i in 1 2 3 4 5
#do
#    iwpriv $WLAN_STR show pleinfo
#done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show pseinfo
done
#for i in 1 2 3 4 5 6
#do
#    iwpriv $WLAN_STR show txdinfo=fid
#done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show tpinfo
done
for i in 1 2 3 4 5 6
do
    iwpriv $WLAN_STR show MibBucket
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show dschinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stainfo
done

iwpriv $WLAN_STR mac 820f3080
iwpriv $WLAN_STR mac 820FD000
for i in 1 2 3 4 5
do
iwpriv $WLAN_STR mac 820FD020
done
for i in 1 2 3 4 5
do
iwpriv $WLAN_STR mac 820FD220
done
for i in 1 2 3 4 5
do
iwpriv $WLAN_STR mac 820F4128
done
iwpriv $WLAN_STR mac 820F409c
iwpriv $WLAN_STR mac 820FA044
iwpriv $WLAN_STR mac 820F6024
iwpriv $WLAN_STR mac 820600b0
for i in 1 2 3 4 5
do
iwpriv $WLAN_STR mac 820f3190
done

iwpriv $WLAN_STR mac 820f5220-820f523c
iwpriv $WLAN_STR mac 820fb05c
iwpriv $WLAN_STR mac 820fc008
iwpriv $WLAN_STR mac 820f3110-820f3114
iwpriv $WLAN_STR mac 820fb030
iwpriv $WLAN_STR mac 820fb034

iwpriv $WLAN_STR show driverinfo
iwpriv $WLAN_STR show wtbl=0
iwpriv $WLAN_STR show bcninfo
iwpriv $WLAN_STR show dbdcinfo
echo "Start show Blocked message!"
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show pleinfo
done

if [[ $2 -gt 0 ]];then
    for i in 1 2 3 4 5 6
    do
        iwpriv $WLAN_STR show txdinfo=$2
    done
fi

echo "-----------End get $WLAN_STR NoBeacon information-------------"
