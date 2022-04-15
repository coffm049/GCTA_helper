library(tidyverse)

df <- read.table("temp_pc")

read.table("temp_covar") %>%
	inner_join(df, by = c("V1", "V2")) %>%
	write.table("temp_all", row.names=F, col.names = F, quote=F)
