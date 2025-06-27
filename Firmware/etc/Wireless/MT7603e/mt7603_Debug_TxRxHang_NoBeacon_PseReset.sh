#!/bin/sh

if [[ "$1" == "--help" ]];
then
   echo "Please type in:$0 'wlanx' 'N'."
   echo "'wlanx' is the wlan interface, 'wlanx' default is wlan0."
   echo "'N' is 1 for get command status information."
   echo "'N' is 2 for get CR information."
   echo "'N' is 3 for change debug level."
   exit 1
fi

WLAN_STR=wlan0

case "$1" in
"wlan"*)
    WLAN_STR=$1;;
esac

if [[ "$2" == "1" ]];then
    echo "-----------Strat get command status information-------------"

    iwpriv $WLAN_STR set Debug=2
    iwpriv $WLAN_STR show stainfo
    iwpriv $WLAN_STR show txqinfo
    iwpriv $WLAN_STR show tmacinfo
    iwpriv $WLAN_STR show sta_tr
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR show trinfo
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR show pseinfo
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR show mibinfo
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR show dschinfo
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR show stat
        sleep 1
    done
    for i in 1 2 3 4 5 6 7 8 9
    do
        iwpriv $WLAN_STR set get_fid=$i
    done

    echo "-----------End get command status information-------------"
fi


if [[ "$2" == "2" ]];then
    echo "-----------Strat get CR information-------------"
    for i in 1 2 3 4 5 6 7 8 9 10
    do
        iwpriv $WLAN_STR mac 60120118
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR mac 8118=00470000,8118
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR mac 8024=00470000,8024
    done
    for i in 1 2 3 4 5 6 7 8 9 10
    do
        iwpriv $WLAN_STR mac 60130110
    done
    for i in 1 2 3 4 5
    do
        iwpriv $WLAN_STR mac 240a0
    done

    iwpriv $WLAN_STR mac 60000014=1f
    iwpriv $WLAN_STR mac 60000018=07070707
    iwpriv $WLAN_STR mac 6000004c=19191919
    for i in 1 2 3 4 5 6 7 8 9 10
    do
        iwpriv $WLAN_STR mac 60000024
    done

    iwpriv $WLAN_STR mac 10618
    iwpriv $WLAN_STR mac 21254
    iwpriv $WLAN_STR mac 60120080
    iwpriv $WLAN_STR mac 6013009c
    iwpriv $WLAN_STR mac 60330030
    iwpriv $WLAN_STR mac 6033001C
    iwpriv $WLAN_STR mac 4540-467c
    iwpriv $WLAN_STR mac 60130114-60130128
    iwpriv $WLAN_STR mac 60100044

    iwpriv $WLAN_STR mac 60100048
    iwpriv $WLAN_STR mac 6010004C
    iwpriv $WLAN_STR mac 24458
    iwpriv $WLAN_STR mac 240a4
    iwpriv $WLAN_STR mac 240a8
    iwpriv $WLAN_STR mac 240ac
    iwpriv $WLAN_STR mac 21518
    iwpriv $WLAN_STR mac 21854
    iwpriv $WLAN_STR mac 60300034
    iwpriv $WLAN_STR mac 4204
    iwpriv $WLAN_STR mac 4200
    iwpriv $WLAN_STR mac 4244
    iwpriv $WLAN_STR mac 60120070
    iwpriv $WLAN_STR mac 60120100
    iwpriv $WLAN_STR mac 60120104-60120130
    echo "-----------End get CR information-------------"
fi


if [[ "$2" == "3" ]];then
    echo "-----------change Debug level,before grab Sniffer information in fail-------------"
    iwpriv $WLAN_STR set Debug=3
fi