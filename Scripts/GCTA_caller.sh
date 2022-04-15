#!/bin/bash
source /home/christian/Research/Stat_gen/tools/GCTA_helper/Scripts/GCTA_wrapper.sh
# grm: prefix for grm files
# covar: file path to covariates file
# covars: list of indices for covariates to select
# pheno: file path to phenotypes
# mp: single index selecting which phenotype from phenotype file 
# PC: file path for PC file
# npc: number of PC's to control for
# out: file path to save output

DIR=/home/christian/Research/Stat_gen/tools/GCTA_helper/Example

declare -a covs=(1 2)

gcta_wrapper \
        ${DIR}/small \
        ${DIR}/small_covars.txt \
        ${covs}  \
        ${DIR}/small_pheno.phen \
        1 \
        ${DIR}/pcas.eigenvec \
        8 \
        delete

