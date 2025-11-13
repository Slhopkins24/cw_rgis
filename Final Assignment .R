if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               ggeffects,
               sf,
               terra,
               tidyterra,
               exactextractr,
               mapview,
               here)

#prepare ecological data
(df_finsync <- read_csv(here("data/data_finsync_nc.csv")))


df_finsync %>% 
  pull(latin) %>% 
  unique() %>% 
  sort()

df_finsync %>% 
  filter(latin == "Nocomis leptocephalus")

