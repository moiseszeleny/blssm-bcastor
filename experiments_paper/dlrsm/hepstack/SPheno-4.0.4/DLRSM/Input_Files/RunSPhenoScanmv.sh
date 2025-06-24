#!/bin/bash

# Multivariate scan over all MINPAR variables in LesHouches.in.DLRSM_template
# Edit the ranges below as needed for your scan

# Remove old results
tmpfile="LesHouches.in.DLRSM.tmp"
rm -f results_h1.dat results_h2.dat

# Define scan ranges for each MINPAR variable
lam1_range=( $(seq -4.0 1.0 4.0) )
lam2_range=( $(seq -4.0 1.0 4.0) )
lam3_range=( $(seq -4.0 1.0 4.0) )
lam4_range=( $(seq -4.0 1.0 4.0) )
lam5_range=( $(seq -4.0 1.0 4.0) )
lam6_range=( $(seq -4.0 1.0 4.0) )
rho1_range=( $(seq -4.0 1.0 4.0) )
rho2_range=( $(seq -4.0 1.0 4.0) )
alp1_range=( $(seq -4.0 1.0 4.0) )
alp2_range=( $(seq -4.0 1.0 4.0) )
alp3_range=( $(seq -4.0 1.0 4.0) )

for lam1 in "${lam1_range[@]}"; do
for lam2 in "${lam2_range[@]}"; do
for lam3 in "${lam3_range[@]}"; do
for lam4 in "${lam4_range[@]}"; do
for lam5 in "${lam5_range[@]}"; do
for lam6 in "${lam6_range[@]}"; do
for rho1 in "${rho1_range[@]}"; do
for rho2 in "${rho2_range[@]}"; do
for alp1 in "${alp1_range[@]}"; do
for alp2 in "${alp2_range[@]}"; do
for alp3 in "${alp3_range[@]}"; do
  sed -e "s#LAM1INPUT#$lam1#" \
      -e "s#LAM2INPUT#$lam2#" \
      -e "s#LAM3INPUT#$lam3#" \
      -e "s#LAM4INPUT#$lam4#" \
      -e "s#LAM5INPUT#$lam5#" \
      -e "s#LAM6INPUT#$lam6#" \
      -e "s#RHO1INPUT#$rho1#" \
      -e "s#RHO2INPUT#$rho2#" \
      -e "s#ALP1INPUT#$alp1#" \
      -e "s#ALP2INPUT#$alp2#" \
      -e "s#ALP3INPUT#$alp3#" \
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
  echo -e "$lam1\t$lam2\t$lam3\t$lam4\t$lam5\t$lam6\t$rho1\t$rho2\t$alp1\t$alp2\t$alp3\t$mh1" >> results_h1.dat
  echo -e "$lam1\t$lam2\t$lam3\t$lam4\t$lam5\t$lam6\t$rho1\t$rho2\t$alp1\t$alp2\t$alp3\t$mh2" >> results_h2.dat

done; done; done; done; done; done; done; done; done; done; done
done

echo "Multivariate scan complete. Results in results_h1.dat and results_h2.dat."
