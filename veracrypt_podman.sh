#!/bin/bash

function press_exit(){
 read -s -n 1 -p "Premi un tasto per uscire . . ."
 exit
}

DIR_VOL="/mnt/vera/pod"
DIR="/media/veracrypt1/TCExpry"
DIR_MOUNT="/media/veracrypt1"

read -n30 -p "Avvio [start] o Spengo [stop] i container? [start,stop]" choice

case $choice in
  start) if [ -d "$DIR" ]; then
                                echo "Volume già Sbloccato"
                                podman start TcIsvVera && echo "TrueCommand ISv Avviato" &&>
                        else
                                echo "Sblocchimao il Volume"
                                veracrypt -t -k "" --pim=0 --protect-hidden=no $DIR_VOL $DI>
                                echo "Avvio i Container"
                                podman start TcIsvVera && echo "TrueCommand ISv Avviato" &&>
                        press_exit
                fi
                ;;

  stop) echo " Arresto i Container..."
        podman stop TcIsvVera && echo "TrueCommand ISv Arrestato"
        podman stop TcExpryVera && echo "TrueCommand Expry Arrestato" && veracrypt -d  $DIR>
         *) echo " non so cosa fare... " ;;
esac
