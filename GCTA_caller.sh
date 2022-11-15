#!/bin/bash
source /home/christian/Research/Stat_gen/tools/GCTA_helper/Scripts/GCTA.sh
source /home/christian/Research/Stat_gen/tools/GCTA_helper/Scripts/looper.sh
# grm: prefix for grm files
# covar: file path to covariates file
# covars: list of indices for covariates to select
# pheno: file path to phenotypes
# mp: single index selecting which phenotype from phenotype file 
# PC: file path for PC file
# npc: number of PC's to control for
# out: file path to save output

DIR=/home/christian/Research/Stat_gen/tools/Basu_herit/Example/Input_files

grm=$DIR/grm
covar=$DIR/covar.txt
covars="abcd_site"
pheno=$DIR/pheno.phen
mp="1 7 6"
PC=${DIR}/pcas.eigenvec
npc=3
out=GCTA_try_delete


gcta_looper \
        $grm \
        $covar \
        $covars \
        $pheno \
        $mp \
        $PC \
        $npc \
        $out


# TRoubleshoot in R
#DIR="/home/christian/Research/Stat_gen/tools/Basu_herit/Example"
#GRM=paste0(DIR, "/Input_files/grm")
#COV=paste0(DIR, "/Input_files/covar_no_name.txt")
#COVs=c(1, 2)
#MPHEN=1
#EIG=paste0(DIR, "/Input_files/pcas.eigenvec")
#PHENO=paste0(DIR, "/Input_files/pheno_no_name.phen")
#EIGS=8
#OUT=paste0(DIR, "/GCTA_try_delete")



