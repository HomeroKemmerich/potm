library(adagio)

# Solves the 0-1 (binary) single knapsack problem.

# Example 1
p <- c(15, 100, 90, 60, 40, 15, 10,  1)
w <- c( 2,  20, 20, 30, 40, 30, 60, 10)
cap <- 102
(is <- knapsack(w, p, cap))
# [1] 1 2 3 4 6 , capacity 102 and total profit 280

## Example 2
p <- c(70, 20, 39, 37, 7, 5, 10)
w <- c(31, 10, 20, 19, 4, 3,  6)
cap <- 50
(is <- knapsack(w, p, cap))
# [1] 1 4 , capacity 50 and total profit 107


## Example 3: multiple knapsack
p <- c(110, 150, 70, 80, 30, 5)
w <- c( 40,  60, 30, 40, 20, 5)
k <- c(65, 85)
(is <- mknapsack(p, w, k))
# kps 1: 2,6; kps 2: 1,4; value: 345; backtracks: 14

## Example 4: multiple knapsack
p <- c(78, 35, 89, 36, 94, 75, 74, 79, 80, 16)
w <- c(18,  9, 23, 20, 59, 61, 70, 75, 76, 30)
k <- c(103, 156)
(is <- mknapsack(p, w, k))
# kps 1: 1,3,6; kps 2: 4,5,9; value: 452; backtracks: 4 
