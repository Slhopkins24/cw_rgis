if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               terra,
               tidyterra,
               mapview,
               stars)

(spr_ex <- rast("data/spr_example.tif"))

# overwrite = TRUE enables overwriting

# overwrite = TRUE enables overwriting
writeRaster(x = spr_ex, 
            filename = "data/spr_elev.tif",
            overwrite = TRUE)
ggplot() +
  geom_spatraster(data = spr_ex)

star_ex <- st_as_stars(spr_ex)
mapview(star_ex)

v_elev <- values(spr_ex)
head(v_elev)

extract(spr_ex, y = cbind(6.0000, 50.0000))

(df_point <- tibble(lon = c(6, 5.9), lat = c(50, 49.96)))

extract(spr_ex, y = df_point)

## load forest raster
(spr_for <- rast("data/spr_forest_nc.tif"))

ggplot() +
  geom_spatraster(data = spr_for)

unique(spr_for)

v_binary <- values(spr_for)
(p_forest <- mean(v_binary))

(spr_land <- rast("data/spr_land_reclass.tif"))

unique(spr_land)

extract(spr_land, cbind(-79.8063, 36.0701))

# write a conversion matrix
# left, original value
# right, value after conversion
(cm <- cbind(c(0, 1001, 1010, 1100),
             c(0, 1, 0, 0)))

spr_bin <- classify(spr_land,
                    rcl = cm)

# 4.2.5 Exercise---------------------------------------------------

spr_prec_ncne <- terra::rast("data/spr_prec_ncne.tif")

spr_prec_ncne

#1. there are 162,

library(ggplot2)
library(tidyterra)

ggplot() +
  geom_spatraster(data = spr_prec_ncne) +
  scale_fill_viridis_c(name = "Precipitation (mm)") +
  labs(title = "Spring Precipitation in North Carolina") +
  theme_minimal()

library(sf)
sf_site <- readRDS("data/sf_finsync_nc.rds")

df_xy <- st_coordinates(sf_site)
head(df_xy)

df_land <- terra::extract(spr_land, df_xy)
head(df_land)

table(df_land[[2]]) # column 2 holds land use values
which.max(table(df_land[[2]])) # most frequent category

# Example: 3 = urban
rcl <- matrix(c(3, 3, 1,   # urban = 1
                1, 2, 0,   # all others = 0
                4, 10, 0), # if more classes exist
              ncol = 3, byrow = TRUE)

spr_urban <- classify(spr_land, rcl = rcl)

urban_cells <- freq(spr_urban)
urban_prop <- urban_cells[urban_cells$value == 1, "count"] / sum(urban_cells$count)
urban_prop










