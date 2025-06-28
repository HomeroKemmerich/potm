# Knapsack IP example
#
# Suppose we have nine items with the following weights and values:
#   w  v 
# 1 30 500
# 2 35 300
# 3 10 100
# 4 15 210
# 5 35 360
# 6 22 180
# 7 29 220
# 8 18 140
# 9 11 90
#
# We wish to fill a knapsack with as much value as possible, but we have a weight capacity of 100.
# What items should we put in the knapsack?
# 
# We can make an Integer Programming problem to solve this.
# Let x1,...,x9 be binary variables (i.e., xi=0 or xi=1, for all i) with xi=1 iff item i goes in the knapsack.
# Let w1,...,w9 be the corresponding weights and v1,...,v9 be the corresponding values.
#
# Then we wish to maximize x1v1+x2v2+...+x9v9 subject to x1w1+x2w2+...+x9w9 <= 100.
# Since our objective function is linear, and our one constraint is linear, this is a linear programming problem,
# and since our variables x1,...,x9 take on only integer values, this is an integer programming problem.

# Solving it in R:

# import the lpsolve library
library(lpSolve)

# objective function
knapsack.obj <- c(500,300,100,210,360,180,220,140,90)

#constraints
knapsack.con <- matrix(c(30,35,10,15,35,22,29,18,11),nrow=1,byrow=TRUE)
knapsack.dir <- c("<=")
knapsack.rhs <- c(100)

#solve
# Note when we call the lp function, we set all.bin=TRUE to indicate that all variables are 0 or 1
# If we just wanted to specify integer values generally, we would set all.int=TRUE
# The default for both of these options if FALSE
knapsackSolution <- lp("max", knapsack.obj, knapsack.con, 
                       knapsack.dir, knapsack.rhs, 
                       all.bin=TRUE) 
print("Solution is:")
print(knapsackSolution$solution)

print("Objective function value at solution is:")
print(knapsackSolution$objval)
