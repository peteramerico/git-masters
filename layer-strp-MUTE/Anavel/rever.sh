#!/bin/bash

for i in {25..25525..500}
do
sfgrey<./cig$i.rsf|sfpen&
sfipick<stk$i.rsf >pick$i.rsf
done

