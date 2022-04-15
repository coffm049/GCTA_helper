#!/bin/bash
# Purpose: Allows for variables selection, as pc selection within GCTA's framework



GCTA=/home/christian/Research/Stat_gen/tools/GCTA/gcta_1.93.2beta/gcta64


gcta_wrapper () {
	local grm=$1
	local covar=$2
	declare covars=($3)
	local pheno=$4
	local mp=$5
	local PC=$6
	local npc=$7
	local out=$8
	
	# select only the pcs from hte PC data
	cut -d " " -f -$((npc + 2)) ${PC} > temp_pc

	# join covars and PCs into one datset 
	Rscript ../Scripts/select_n_join_PCs_covs.R ${covar} ${covars} 

	# run GCTA
	${GCTA} --grm $grm --reml --pheno $pheno --mpheno $mp --qcovar temp_all  --out $out

	# remove temporary dataframes
	rm temp*
	
	# create a nice covariate list
	bar=$(IFS=, ; echo "${covars[*]}")

	# extract the heritability estimate
	h=$(tail -7 delete.hsq | head -1)

	# Save all of the data to file
	echo "$h	$mp	$bar	$npc" >> stored_herits

	# remove temporary 
	rm delete*	
}


