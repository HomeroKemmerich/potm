library(optrees)

# Graph
nodes <- 1:7
arcs <- matrix(c( 1,2,7,  1,4,5,
                  2,3,8,  2,5,7,
                  3,5,5,  4,5,15,
                  4,6,6,  5,6,8,
                 6,7,11,  5,7,9), ncol = 3, byrow = TRUE)

# Minimum cost spanning tree with several algorithms
getMinimumSpanningTree(nodes, arcs, algorithm = "Prim")
getMinimumSpanningTree(nodes, arcs, algorithm = "Kruskal")
getMinimumSpanningTree(nodes, arcs, algorithm = "Boruvka")
