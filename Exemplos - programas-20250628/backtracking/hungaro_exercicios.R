########################################################
# Exercício 3
exe3 <- matrix (c(17, 4, 10, 15, 5, 8, 18, 7, 11), nrow=3, byrow = TRUE) 
exe3 

library(clue)
solve_LSAP(exe3,maximum = FALSE) 
yexe3 <- solve_LSAP(exe3,maximum = FALSE) 
sum(exe3[cbind(seq_along(yexe3), yexe3)]) 

library(lpSolve) 
lp.assign (exe3,direction = "min") 
lp.assign (exe3)$solution 

########################################################
# Exercício 4
exe4 <- matrix (c(12,  9,  7,  7, 10,
                  15, 11,  8, 13, 14,
                   9,  6,  5, 12, 12,
                   6,  9, 13,  7, 10,
                   8, 13, 12,  9, 13), ncol=5, byrow = TRUE) 
exe4 

library(clue)
solve_LSAP(exe4,maximum = FALSE) 
yexe4 <- solve_LSAP(exe4,maximum = FALSE) 
sum(exe4[cbind(seq_along(yexe4), yexe4)]) 

library(lpSolve) 
lp.assign (exe4,direction = "min") 
lp.assign (exe4)$solution 

########################################################
# Exercício 5
exe5 <- matrix (c(150, 65, 210, 135, 0,
                  175, 75, 230, 155, 0,
                  135, 85, 200, 140, 0,
                  140, 70, 190, 130, 0,
                  170, 50, 200, 160, 0), nrow=5,ncol=5, byrow = TRUE) 
exe5 

library(clue)
solve_LSAP(exe5,maximum = TRUE) 
yexe5 <- solve_LSAP(exe5,maximum = TRUE) 
sum(exe5[cbind(seq_along(yexe5), yexe5)]) 

library(lpSolve) 
lp.assign (exe5,direction = "max") 
lp.assign (exe5)$solution 

########################################################
# Exercício 6
exe6 <- matrix (c(20, 15, 10, 10, 17, 23, 25,  5, 15,
                  10, 10, 12, 15,  9,  7,  8,  7,  8,
                  12,  9,  9, 10, 10,  5,  7, 13,  9,
                  13, 14, 10, 15, 15,  5,  8, 20, 10,
                  12, 13, 10, 15, 14,  5,  9, 20, 10,
                  15, 14, 15, 16, 15,  5, 10, 20, 10,
                   7,  9, 12, 12,  7,  6,  7, 15, 12,
                   5,  6,  8,  8,  5,  4,  5, 10,  7,
                   5,  6,  8,  8,  5,  4,  5, 10,  7), 9,9, byrow = TRUE) 
exe6 

library(clue)
solve_LSAP(exe6,maximum = TRUE) 
yexe6 <- solve_LSAP(exe6,maximum = TRUE) 
sum(exe6[cbind(seq_along(yexe6), yexe6)]) 

library(lpSolve) 
lp.assign (exe6,direction = "max") 
lp.assign (exe6)$solution 
