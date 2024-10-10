library(tspmeta)

TSP_rs<- read.table("cidades_rs.txt", sep=",", header = TRUE)
coords.df <- data.frame(long=TSP_rs$Longitude, lat=TSP_rs$Latitude)
coords.mx <- as.matrix(coords.df)

# Compute distance matrix
dist.mx <- dist(coords.mx)

# Construct a TSP object
tsp.ins <- tsp_instance(coords.mx, dist.mx )
#

# "nearest_insertion", "farthest_insertion", "cheapest_insertion", 
# "arbitrary_insertion", "nn", "repetitive_nn", "2-opt"

tour <- run_solver(tsp.ins, method="2-opt")
tour <- run_solver(tsp.ins, method="cheapest_insertion")


#Plot
theme_update(plot.title = element_text(hjust = 0.5))
autoplot(tsp.ins, tour) +
  geom_text(aes(x=TSP_rs$Longitude, y=TSP_rs$Latitude,label = TSP_rs$Cidade)) +
  ggtitle("TSP using tsometa package") +
  xlab("Longitude") + ylab("Latitude")

