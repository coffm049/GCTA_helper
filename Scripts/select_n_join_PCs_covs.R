#!/usr/bin/env Rscript
# To print the command and its result in the output.
options(echo=F, message=F)
suppressPackageStartupMessages(library(tidyverse))
library(argparse)


parser <- ArgumentParser()

# specify our desired options 
# by default ArgumentParser will add an help option 
parser$add_argument("-c", "--Covariate", type = "character",
    help="Path to covariate file", metavar = "PATH_TO_COVARIATES")
parser$add_argument("-i", "--Covariates", type = "character", 
    help="Names of variables to control for", nargs = "+")
parser$add_argument("-p", "--PC", type="character",  
    help="Path to prinicipal component file (.eigenvec)",
    metavar="FILE_PATH")
parser$add_argument("-n", "--npc", default=0, type = "integer", 
    help = "number of principal components to include")

args <- parser$parse_args()


# Load specific covariates
df <- read_table(args$Covariate, col_names = TRUE) %>%
	select("FID", "IID", args$Covariates) %>%
	mutate(FID = as.character(FID), IID = as.character(IID))


# Read the pc data frame
read_table(args$PC, col_names=F) %>%
	rename(FID = X1, IID= X2) %>%
	select(1:(args$npc+2)) %>%
	mutate(FID = as.character(FID), IID = as.character(IID)) %>%
        # join the pcs and the covars by FID and IID
        inner_join(df, by = c("FID", "IID")) %>%
        # save the combined data into a temp file
        write.table("temp_covars", row.names=F, col.names = F, quote=F)




