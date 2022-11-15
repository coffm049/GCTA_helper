#!/bin/bash
# Purpose: Allows for variables selection, as pc selection within GCTA's framework



GCTA=/home/christian/Research/Stat_gen/tools/GCTA/gcta_1.93.2beta/gcta64
R=/usr/bin/Rscript
SEL=/home/christian/Research/Stat_gen/tools/GCTA_helper/Scripts/select_n_join_PCs_covs.R

source /home/christian/Research/Stat_gen/tools/GCTA_helper/Scripts/GCTA.sh


gcta_looper () {
	local grm=$1
	local covar=$2
	declare covars=($3)
	local pheno=$4
	local mp=$5
	local PC=$6
	local npc=$7
	local out=$8
	
	# Loop over all phenotypes
	for MP in $mp
	do

        	gcta_wrapper \
                	$grm \
                	$covar \
                	$covars \
                	$pheno \
                	$MP \
                	$PC \
                	$npc \
                	delete
	done
}




