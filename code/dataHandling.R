library(raster)
library(sf)
library(ncdf4)


pathFile <- "..."

nf <- nc_open(pathFile)
tms    <- as.POSIXct(nf$var[[1]]$dim[[4]]$vals*60*60, "1900-01-01", tz = "GMT")
nc_close(nf)


brk <- brick(m10path, varname = "u10", level = 1)[[i]]


wnd  <- extract(tmpBrick[[1:2]], ind[,2:3])
dir  <- atan2(wnd[,1], wnd[,2]) * (180/pi)
spd  <- sqrt(wnd[,1]^2 + wnd[,2]^2)


test <- 1+10