#!/bin/bash

rm results_h1.dat
rm results_h2.dat
for i in $(seq 1.20 0.01 1.30)
do
sed -e "s#LAM1INPUT#$i#" \
    LesHouches.in.DLRSM_template > /LesHouches.in.DLRSM
rm SPheno.spc.DLRSM
./bin/SPhenoDLRSM
mh1 = 'cat SPheno.spc.DLRSM | grep "# hh_1" | grep -v DECAY | sed 's/\(.*\) 25 \(.*\)\# hh_1/\2/g''
mh2 = 'cat SPheno.spc.DLRSM | grep "# hh_2" | grep -v DECAY | sed 's/\(.*\) 35 \(.*\)\# hh_2/\2/g''
echo $i $mh1 >> results_h1.dat
echo $i $mh2 >> results_h2.dat
done 