if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               sf,
               mapview, 
               here)

# read/export vector data-------------------------------------------------------

# read a shapefile (e.g., ESRI Shapefile format)
# `quiet = TRUE` just for cleaner output
sf_nc_county <- st_read(dsn = here("data/nc.shp"),
                         quiet = TRUE)
st_write(sf_nc_county,
         dsn = here("data/sf_nc_county.shp"),
         append = FALSE)

# export as geopackage
st_write(sf_nc_county,
         dsn = here("data/sf_nc_county.gpkg"),
         append = FALSE)

# export as rds
saveRDS(sf_nc_county,
        file = here("data/sf_nc_county.rds"))

#read rds
sf_county_county <- readRDS(file = here("data/sf_nc_county.rds"))


# point data
sf_site <- readRDS(file = here("data/sf_finsync_nc.rds"))

mapview(sf_site,
        col.regions = "black", # point's fill color
        legend = FALSE) # disable legend

##take the first 10 sites
sf_site10 <- sf_site %>%
  slice(1:10)


# line data
sf_str <- readRDS(here("data/sf_stream_gi.rds"))

mapview(sf_str,
        color = "steelblue", # line's color
        legend = FALSE) # disable legend

##take the first 10 sites
sf_str_f10 <- sf_str %>%
    slice(1:10)

mapview(sf_str_f10,
        color = "steelblue", # line's color
        legend = FALSE) # disable legend

# polygon
mapview(sf_nc_county,
        col.regions = "darkgreen",
        legend = FALSE)

## pick guilford county
sf_nc_gi <- sf_nc_county %>%
   filter(county == "guilford")

mapview(sf_nc_gi,
        col.regions ="blue",
        legend = FALSE)
#use ggplot to see a map
## not a great map
ggplot() +
  geom_sf(data = sf_nc_county) +
  geom_sf(data =sf_str) +
  geom_sf(data = sf_site)

# a little better
ggplot() +
  geom_sf(data = sf_nc_gi) +
  geom_sf(data = sf_str)

#exercise-------------------------------------------------------

# Read stream line data for Ashe county
sf_str_as <- readRDS(here("data/sf_stream_as.rds"))

#Check coordinate reference systems (CRS)
print(sf_str_as)
print(sf_nc_county)


# Map streams and county boundaries
ggplot() +
  geom_sf(data = sf_nc_county) +
  geom_sf(data =sf_str_as)

#Subset county layer to Ashe county and remap
sf_nc_as <- sf_nc_county %>%
  filter(county == "ashe")

#map
ggplot() +
  geom_sf(data = sf_nc_as) +
  geom_sf(data = sf_str_as)






