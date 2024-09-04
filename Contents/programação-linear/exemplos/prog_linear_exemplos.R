# exemplo dos slides
f_obj = c(22,18)
restricoes_1 = c(1.5,1)
restricoes_2 = c(3,2.5)
restricoes   = rbind(restricoes_1, restricoes_2)
disponibilidade = c(15,24)

library(boot)
simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
#simplex(f_obj, rest1, disp1, rest2, disp2, rest3, disp3, maxi = TRUE)
# ????1 <=              ????2 >=              ????3 =

#install.packages("linprog")
library(linprog)
solveLP(f_obj, disponibilidade, restricoes, TRUE)

solveLP(f_obj, disponibilidade, restricoes, TRUE, 
        const.dir = c( "<=", "<="))
