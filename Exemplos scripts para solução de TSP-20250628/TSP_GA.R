library(GA)
library(igraph)

D <- as.matrix(read.table("trajetos_ams_teste.txt", sep=","))
#D <- as.matrix(read.table("trajetos_ams2_teste.txt", sep=","))

nome_cidades = c("Araguari", "Araxa", "Patos de Minas", "Patrocinio",
                 "Uberaba", "Uberlandia", "Belo Horizonte")
#nome_cidades = c("Aveiro", "Badajos", "Cordoba", "Evora", "Faro", "Madri")

dimnames(D) <- list(nome_cidades,nome_cidades)

# given a tour, calculate the total distance
tourLength <- function(tour, distMatrix) {
  tour <- c(tour, tour[1])
  route <- embed(tour, 2)[, 2:1]
  sum(distMatrix[route])
}
# inverse of thetotal distance is the fitness
tpsFitness <- function(tour, ...) 1/tourLength(tour, ...)

# run a GA algorithm
GA.fit <- ga(type = "permutation", fitness = tpsFitness, distMatrix = D, lower = 1, 
             upper = ncol(D), popSize = 10, maxiter = 500, run = 100, pmutation = 0.2, 
             monitor = NULL, keepBest = TRUE)

plot(GA.fit)

getAdj <- function(tour) {
  n <- length(tour)
  from <- tour[1:(n - 1)]
  to <- tour[2:n]
  m <- n - 1
  A <- matrix(0, m, m)
  A[cbind(from, to)] <- 1
  A <- A + t(A)
  return(A)
}

# 2-d coordinates
mds <- cmdscale(D)
x <- mds[, 1]
y <- -mds[, 2]
n <- length(x)

plot(x, y, type = "n", asp = 1, xlab = "", ylab = "", main = "Tour after GA converged")
points(x, y, pch = 16, cex = 1.5, col = "grey")
abline(v = pretty(range(x), 10), h = pretty(range(y), 10), col = "lightgrey")
tour <- GA.fit@solution[1, ]
tour <- c(tour, tour[1])
n <- length(tour)
arrows(x[tour[-n]], y[tour[-n]], x[tour[-1]], y[tour[-1]], length = 0.15, angle = 45, 
       col = "black", lwd = 2)
text(x, y, labels(x), cex = 1, col = "blue")


plot(x, y, type = "n", asp = 1, xlab = "", ylab = "", main = "Tour from the iterators")
points(x, y, pch = 16, cex = 1.5, col = "grey")
abline(v = pretty(range(x), 10), h = pretty(range(y), 10), col = "lightgrey")
text(x, y, labels(x), cex = 1, col = "blue")

for(i in 1:length(GA.fit@bestSol)){
  tour <- as.numeric(GA.fit@bestSol[i][[1]])
  tour <- c(tour[1:7], tour[1])
  n <- length(tour)
  arrows(x[tour[-n]], y[tour[-n]], x[tour[-1]], y[tour[-1]], length = 0.15, angle = 45, 
         col = "gray", lwd = 2)
  Sys.sleep(0.05)
  arrows(x[tour[-n]], y[tour[-n]], x[tour[-1]], y[tour[-1]], length = 0.15, angle = 45, 
         col = "white", lwd = 2)
}
abline(v = pretty(range(x), 10), h = pretty(range(y), 10), col = "lightgrey")
text(x, y, labels(x), cex = 1, col = "blue")
tour <- GA.fit@solution[1, ]
tour <- c(tour, tour[1])
n <- length(tour)
arrows(x[tour[-n]], y[tour[-n]], x[tour[-1]], y[tour[-1]], length = 0.15, angle = 45, 
       col = "red", lwd = 2)
text(x, y, labels(x), cex = 1, col = "blue")

