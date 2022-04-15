# To print the command and its result in the output.
options(echo=F, message=F)
suppressPackageStartupMessages(library(tidyverse))

# Get the arguments as a character vector.
myargs = commandArgs(trailingOnly=TRUE)


# Get columns for keeping
keep_vars <- c(1, 2, as.numeric(myargs[2:length(myargs)]))



# Load specific covariates
df <- read_table(myargs[1], col_names= F)[,keep_vars]
# rename columns for joining
colnames(df) <- paste0("X", seq(1, dim(df)[2]))

# Read the pc data frame
read_table("temp_pc", col_names=F) %>%
	# join the pcs and the covars by FID and IID
	inner_join(df, by = c("X1", "X2")) %>%
	# save the combined data into a temp file
        write.table("temp_all", row.names=F, col.names = F, quote=F)







