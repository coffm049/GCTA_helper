#!/bin/bash
# Experimenting with variable scope


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
	${GCTA} --grm $grm --reml --pheno $pheno --out $out	
}

