#!/bin/bash
#
#script que organiza os picks de velocidade em ordem crescente de profundidade
#

for i in {25..25025..500}
do
cat pick$i.rsf|sort -n>temp$i.dat
mv temp$i.dat pick$i.rsf
done

rm -f temp*.dat

