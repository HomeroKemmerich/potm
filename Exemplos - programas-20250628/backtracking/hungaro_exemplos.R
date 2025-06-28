# Exemplo 1
x1 <- matrix (c(53, 47, 60, 
                96, 87, 92, 
                37, 41, 36), 3, 3) 
x1
library(clue) 
solve_LSAP(x1) 
y1 <- solve_LSAP(x1) 
sum(x1[cbind(seq_along(y1), y1)]) 


library(lpSolve) 
lp.assign (x1) 
lp.assign (x1)$solution 

########################################################
# Exemplo 2
x2 <- matrix (c(90, 35, 125,  45, 
                75, 85,  95, 110, 
                75, 55,  90,  95, 
                80, 65, 105, 115), 4, 4) 
x2 

library(clue) 
solve_LSAP(x2) 
y2 <- solve_LSAP(x2) 
sum(x2[cbind(seq_along(y2), y2)]) 

library(lpSolve) 
lp.assign (x2) 
lp.assign (x2)$solution 

########################################################
# Exemplo 3
x3 <- matrix (c(7, 4, 7, 3,10,
                5, 9, 3, 8, 7,
                3, 5, 6, 2, 9,
                6, 5, 0, 4, 8,
                0, 0, 0, 0, 0), nrow=5, ncol=5, byrow = TRUE) 
x3 

library(clue)
solve_LSAP(x3,maximum = TRUE) 
y3 <- solve_LSAP(x3,maximum = TRUE) 
sum(x3[cbind(seq_along(y3), y3)]) 

library(lpSolve) 
lp.assign (x3,direction = "max") 
lp.assign (x3)$solution 