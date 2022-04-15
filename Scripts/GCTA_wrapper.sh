#!/bin/bash
# Purpose: Allows for variables selection, as pc selection within GCTA's framework



GCTA=/home/christian/Research/Stat_gen/tools/GCTA/gcta_1.93.2beta/gcta64


gcta_wrapper () {
	local grm=$1
	local covar=$2
	local covars=$3
	local pheno=$4
	local mp=$5
	local PC=$6
	local npc=$7
	local out=$8
	
	# Add to all values of the bash list
	results=$(
		for val in ${covars[@]}
		do
    			echo $((val + 2))
		done
		)
	#######################################
	# HARDCODE COVARIATE SELECTIONS FOR NOW
	#######################################	
	declare -a results=(1 2)

	# Select only the covars selected from the covar variable
	cut -d " " -f -${results[@]} ${covar} > temp_covar

	# select only the pcs from hte PC data
	cut -d " " -f -$((npc + 2)) ${PC} > temp_pc

	# join covars and PCs into one datset 
	Rscript ../Scripts/Joining_covars_pcs.R 
	
	head temp_all	

	# run GCTA
	${GCTA} --grm $grm --reml --pheno $pheno --mpheno $mp --qcovar temp_all  --out $out
}

#  


