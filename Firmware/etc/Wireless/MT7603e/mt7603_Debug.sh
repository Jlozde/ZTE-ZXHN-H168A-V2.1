#!/bin/sh

if [[ "$1" == "--help" ]];
then
   echo "Please type in:$0 'wlanx' 'mac'."
   echo "'wlanx' is the wlan interface, 'wlanx' default is wlan0."
   echo "'mac' is sta mac, %02x:%02x:%02x:%02x:%02x:%02x."
   exit 1
fi

WLAN_STR=wlan0

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
    iwpriv $WLAN_STR show pseinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show wtbl=1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR show dschinfo
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR set get_fid=1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR set get_fid=2
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR set get_fid=4
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR set get_fid=7
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR set get_fid=8
done

iwpriv $WLAN_STR mac 4540-467c
sleep 1
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60120118
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 8118=00470000
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 8118
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60000014=1f
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60000018=07070707
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 6000004c=19191919
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60000024
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 240a0
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60130110
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60130114-0x60130128
    sleep 1
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60100044-6010004C
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 10618
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 21254
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 60120080
done
for i in 1 2 3 4 5
do
    iwpriv $WLAN_STR mac 80000200
done

iwpriv $WLAN_STR set Debug=0