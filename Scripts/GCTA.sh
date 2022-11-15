#!/bin/bash
# Purpose: Allows for variables selection, as pc selection within GCTA's framework



GCTA=/home/christian/Research/Stat_gen/tools/GCTA/gcta_1.93.2beta/gcta64
R=/usr/bin/Rscript
SEL=/home/christian/Research/Stat_gen/tools/GCTA_helper/Scripts/select_n_join_PCs_covs.R


gcta_wrapper () {
	local grm=$1
	local covar=$2
	declare covars=($3)
	local pheno=$4
	local mp=$5
	local PC=$6
	local npc=$7
	local out=$8
	
	# join covars and PCs into one datset 
	$R $SEL -c $covar -i $covars -p $PC -n $npc 
	
	# run GCTA
	${GCTA} --grm $grm --reml --pheno $pheno --mpheno $mp --qcovar temp_covars --out $out

	# remove temporary dataframes
	rm temp_covars
	
	# create a nice covariate list
	bar=$(IFS=, ; echo "${covars[*]}")

	# extract the heritability estimate
	h=$(tail -7 ${out}.hsq | head -1)

	# Save all of the data to file
	echo "$h	$mp	$bar	$npc" >> stored_herits
	
	# delete hsq and log files
	rm ${out}*
}

