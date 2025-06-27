#!/bin/sh

if [[ "$1" == "--help" ]];
then
   echo "Please type in:$0 'wlanx' 'mac'."
   echo "'wlanx' is the wlan interface, 'wlanx' default is wlan5g0."
   echo "'mac' is sta mac, %02x:%02x:%02x:%02x:%02x:%02x."
   exit 1
fi

WLAN_STR=wlan5g0

case "$1" in
"wlan"*)
    WLAN_STR=$1;;
esac

iwpriv $WLAN_STR set Debug=2

iwpriv $WLAN_STR show driverinfo
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR stat
    iwpriv $WLAN_STR set ResetCounter=1
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stat
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stainfo
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show trinfo
done

iwpriv $WLAN_STR show sysinfo
iwpriv $WLAN_STR show devinfo
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show stacountinfo
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show bainfo
    sleep 1
done

iwpriv $WLAN_STR e2p

iwpriv $WLAN_STR show sta_tr
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show peerinfo=$2
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show mibinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show radiostat
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show bcninfo
done
iwpriv $WLAN_STR show wifi_sys
iwpriv $WLAN_STR show radio_info
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show staoffline
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show chanutil
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show tpinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show swqinfo
done

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show pleinfo=1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show pseinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show MibBucket
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show dschinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show ser
done

iwpriv $WLAN_STR mac 820F082C=F
iwpriv $WLAN_STR mac 80025100=1F
iwpriv $WLAN_STR mac 80025104=07070707
iwpriv $WLAN_STR mac 80025108=38383737
iwpriv $WLAN_STR mac 820F0000
iwpriv $WLAN_STR mac 820F3080
iwpriv $WLAN_STR mac 82060028
iwpriv $WLAN_STR mac 82068028
iwpriv $WLAN_STR mac 820F4124
iwpriv $WLAN_STR mac 820F4130
iwpriv $WLAN_STR mac 820F4134
iwpriv $WLAN_STR mac 820F4138
iwpriv $WLAN_STR mac 820F413C
iwpriv $WLAN_STR mac 820F4140
iwpriv $WLAN_STR mac 820F4144
iwpriv $WLAN_STR mac 820F4148
iwpriv $WLAN_STR mac 820F2050
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820FD020
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F4128
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F20D0
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F20D4
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F20D8
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F20DC
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F3190
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82060220
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82060114
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82060154
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 820F0024
done
iwpriv $WLAN_STR mac 820F409c
iwpriv $WLAN_STR mac 820FA044
iwpriv $WLAN_STR mac 820F6024
iwpriv $WLAN_STR mac 820600b0
iwpriv $WLAN_STR mac 820f5220-820f523c
sleep 1
iwpriv $WLAN_STR mac 820fb05c
iwpriv $WLAN_STR mac 820fc008
iwpriv $WLAN_STR mac 820f3110-820f3114
sleep 1
iwpriv $WLAN_STR mac 820fb030
iwpriv $WLAN_STR mac 820fb034

for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070414=00508C00
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071414=00508C00
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070414=00008C00
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071414=00008C00
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070210
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070214
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070218
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 8207021C
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070220
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070224
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070228
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 8207022C
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070230
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070234
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82070238
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071210
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071214
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071218
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 8207121C
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071220
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071224
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071228
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 8207122C
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071234
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 82071238
done

iwpriv $WLAN_STR set Debug=0