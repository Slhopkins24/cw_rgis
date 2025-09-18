if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse, 
               sf,
               mapview, here)

#read fish data
df_fish <- read_csv("data/data_finsync_nc.csv")

sf_site <- df_fish %>% 
  distinct(site_id, 
           lon,
           lat) %>% 
  st_as_sf(coords = c("lon","lat"), 
crs= 4326)
## data on the map
mapview(sf_site, legend = FALSE)

#export data
saveRDS(sf_site, 
        file = "data/sf_finsync_nc.rds")

#conversion from geodetic to projected -------------------------------

sf_ft_wgs <- sf_site %>% 
  slice(c(1,2))

sf_ft_utm <- sf_ft_wgs %>% 
  st_transform(crs = 32617)

mapview(sf_ft_wgs)

st_distance(sf_ft_utm)

#exercise today

#load data
quakes
df_quakes <- as_tibble(quakes)
print(df_quakes)

#convert
sf_quakes <- df_quakes %>% 
  st_as_sf(coords = c("long", "lat"), crs = 4326)
  
mapview(sf_quakes)
st_bbox(sf_quakes)

sf_quakes <- sf_site %>% slice(c(1,2))

#calculate






