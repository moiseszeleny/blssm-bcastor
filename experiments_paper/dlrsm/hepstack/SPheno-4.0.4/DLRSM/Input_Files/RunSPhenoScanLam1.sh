#!/bin/bash

# Remove old results
tmpfile="LesHouches.in.DLRSM.tmp"
rm -f results_h1.dat results_h2.dat

# Define scan ranges
declare -a lam1_range=( $(seq -4.0 0.5 4.0) )
declare -a lam2_range=( $(seq 0.0 0.5 2.0) )

for lam1 in "${lam1_range[@]}"
do
  for lam2 in "${lam2_range[@]}"
  do
    sed -e "s#LAM1INPUT#$lam1#" -e "s#LAM2INPUT#$lam2#" \
      LesHouches.in.DLRSM_template > "$tmpfile"
    mv "$tmpfile" LesHouches.in.DLRSM
    rm -f SPheno.spc.DLRSM
    /home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/SPheno-4.0.4/bin/SPhenoDLRSM > /dev/null 2>&1
    if [ -f SPheno.spc.DLRSM ]; then
      mh1=$(grep "# hh_1" SPheno.spc.DLRSM | grep -v DECAY | sed 's/.* 25 \(.*\)# hh_1/\1/g')
      mh2=$(grep "# hh_2" SPheno.spc.DLRSM | grep -v DECAY | sed 's/.* 35 \(.*\)# hh_2/\1/g')
    else
      mh1="NaN"
      mh2="NaN"
    fi
    echo -e "$lam1\t$lam2\t$mh1" >> results_h1.dat
    echo -e "$lam1\t$lam2\t$mh2" >> results_h2.dat
  done
done

echo "Scan complete. Results in results_h1.dat and results_h2.dat."