library("TSP")

methods <- c("nearest_insertion", "cheapest_insertion", "farthest_insertion", 
             "arbitrary_insertion", "nn", "repetitive_nn", "2-opt")


#distancias = as.matrix(read.table("trajetos_ams_teste.txt", sep=","))
#nome_cidades = c("Araguari", "Araxa", "Patos de Minas", "Patrocinio", 
#                 "Uberaba", "Uberlandia", "Belo Horizonte")

distancias = as.matrix(read.table("trajetos_ams2_teste.txt", sep=","))
nome_cidades = c("Aveiro", "Badajos", "Cordoba", "Evora", "Faro", "Madri")

dimnames(distancias) <- list(nome_cidades,nome_cidades)

atsp <- ATSP(distancias)
n_of_cities(atsp)
labels(atsp)

## calculate a tour
etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[1]) #nearest_insertion
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[2]) #cheapest_insertion
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[3]) #farthest_insertion
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[4]) #arbitrary_insertion
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[5]) #nn
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[6]) #repetitive_nn
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

etsp <- ETSP(atsp)
tour <- solve_TSP(atsp,methods[7]) #2-opt
tour_length(atsp, tour)
plot(etsp, tour)
head(tour)

