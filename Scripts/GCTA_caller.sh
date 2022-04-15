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

OUT=/panfs/roc/groups/3/rando149/coffm049/ABCD/Results/03_heritability/Estimates/Explore_PCs/Global/GCTA/
PREFIX=/panfs/roc/groups/3/rando149/coffm049/ABCD/Results/01_Gene_QC/filters/filter1/GRMs/EUR_no_rels/EUR_no_rels.grm.bin
COVARS=/panfs/roc/groups/3/rando149/coffm049/ABCD/Results/02_Phenotypes/Covars_no_name.txt
PHENO=/panfs/roc/groups/3/rando149/coffm049/ABCD/Results/02_Phenotypes/asegs_no_names.phen
PC=/panfs/roc/groups/3/rando149/coffm049/ABCD/Results/01_Gene_QC/filters/filter1/Eigens/EUR_no_rels.eigenvec

gcta_wrapper \
        ${PREFIX} \
        ${COVARS} \
        "1 2" \
        ${PHENO} \
        1 \
        ${PC} \
        8 \
        ${OUT} 

