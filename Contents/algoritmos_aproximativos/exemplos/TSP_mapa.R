library(leaflet)
library(sf)
library(tspmeta)

TSP_rs<- read.table("cidades_rs.txt", sep=",", header = TRUE)

df <- data.frame(lon = TSP_rs$Longitude, lat = TSP_rs$Latitude, id = TSP_rs$ID)

coords.df <- data.frame(long=TSP_rs$Longitude, lat=TSP_rs$Latitude)
coords.mx <- as.matrix(coords.df)

# Compute distance matrix
dist.mx <- dist(coords.mx)

# Construct a TSP object
tsp.ins <- tsp_instance(coords.mx, dist.mx )
#

# "nearest_insertion", "farthest_insertion", "cheapest_insertion", 
# "arbitrary_insertion", "nn", "repetitive_nn", "2-opt"

tour <- run_solver(tsp.ins, method="cheapest_insertion")

leaflet(df) %>%
  addTiles() %>%
  addMarkers()

df2 <- df[match(tour, df$id), ] 
df2 <- rbind(df2,df2[1,])

lines <- df2[,1:2] %>%
  as.matrix() %>%
  st_linestring() %>%
  st_sfc(crs = 4326) %>%
  st_transform(crs = 32618)

  lines_map <- lines %>%
  st_transform(crs = 4326) %>%
  as("Spatial") %>%
  leaflet() %>%
  addTiles() %>%
  addPolylines() %>%   
  addMarkers(data=df)

lines_map

