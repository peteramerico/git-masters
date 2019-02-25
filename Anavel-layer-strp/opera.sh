#!/bin/bash

h=250
dx=250
hmax=8750

while [ $h -le $hmax ]
do
    echo $h
    paste ../pick$h.rsf ../../../Migracao02/Anavel02/Opera/pspick$h.rsf>temp
    awk '{print $1,$2-2000+$5,$3}' temp>pick$h.rsf 
    h=$(($h + $dx))
    more temp
done

rm -f temp