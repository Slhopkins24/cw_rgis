(spr_prec <- rast("data/spr_prec_us.tif"))

ext(spr_prec)

## crop to:
## longitude range: -80 to -75
## latitude range: 34 to 37
spr_prec_crop <- crop(x = spr_prec,
                      y = c(-80, -75, 34, 37))

## load county vector 
sf_nc_county <- readRDS("data/sf_nc_county.rds")

ggplot() +
  geom_spatraster(data = spr_prec_crop) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25) 

spr_prec_nc <- crop(x = spr_prec,
                    y = sf_nc_county)

ggplot() +
  geom_spatraster(data = spr_prec_nc) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25) 

spr_nw <- rast("data/spr_prec_ncnw.tif") # Northwest NC
spr_ne <- rast("data/spr_prec_ncne.tif") # Northeast NC
spr_sw <- rast("data/spr_prec_ncsw.tif") # Southwest NC
spr_se <- rast("data/spr_prec_ncse.tif") # Southeast NC

ggplot() +
  geom_spatraster(data = spr_nw) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

spr_n <- merge(spr_nw, spr_ne)

ggplot() +
  geom_spatraster(data = spr_n) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

list_spr <- list(spr_nw,
                 spr_ne,
                 spr_sw,
                 spr_se)

spr_col <- sprc(list_spr)

spr_merge <- merge(spr_col)

ggplot() +
  geom_spatraster(data = spr_merge) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

writeRaster(spr_merge, 
            filename = "data/spr_prec_nc.tif",
            overwrite = TRUE)

#4.3.3 Stack

spr_prec_nc <- rast("data/spr_prec_nc.tif")
spr_tmp_nc <- rast("data/spr_tmp_nc.tif")

print(spr_prec_nc)

(spr_pt_nc <- c(spr_prec_nc,
                spr_tmp_nc))

# precipitation
spr_pt_nc$precipitation

#4.3.4 Reprojection

print(spr_prec_nc)

(spr_prec_nc_proj <- project(x = spr_prec_nc,
                             y = "EPSG:32617"))

#4.3.5 Exercise---------------------------------------------------

#Merge raster files 
spr_tmp_ncnw <- rast("data/spr_tmp_ncnw.tif") 
spr_tmp_ncne <- rast("data/spr_tmp_ncne.tif")  
spr_tmp_ncsw <- rast("data/spr_tmp_ncsw.tif")  
spr_tmp_ncse <- rast("data/spr_tmp_ncse.tif") 

ras_list <- list(spr_tmp_ncnw, spr_tmp_ncne, spr_tmp_ncsw, spr_tmp_ncse)

spr_collection <- sprc(ras_list)

spr_merge <- merge(spr_collection)
spr_merge

ggplot() +
  geom_spatraster(data = spr_merge) +
  geom_sf(data = sf_nc_county, alpha = 0.25) 

#Crop raster to a defined extent


#Reproject raster and explore resampling














