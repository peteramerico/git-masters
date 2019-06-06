#!/bin/bash

h=25
dx=500
hmax=25850

while [ $h -le $hmax ]
do
    echo $h
    paste ./pick$h.rsf ../../../Migracao02/Anavel02/Opera/pspick$h.rsf>temp
    awk '{print $1,$2-2000+$5,$3}' temp>pick$h.rsf 
    h=$(($h + $dx))
    more temp
done

rm -f temp
