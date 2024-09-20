##############################################################################
# exemplo livro pag. 71
# Minimize workforce : s1 + s2 + s3 + s4 + s5 + s6
# Subject To
#   t1: s6 + s1 >= 5
#   t2: s1 + s2 >= 7
#   t3: s2 + s3 >= 18
#   t4: s3 + s4 >= 12
#   t5: s4 + s5 >= 15
#   t6: s5 + s6 >= 10

# Integer s1, s2, s3, s4, s5, s6

f_obj = c(1,1,1,1,1,1)
restricoes_1 = c(1,0,0,0,0,1)
restricoes_2 = c(1,1,0,0,0,0)
restricoes_3 = c(0,1,1,0,0,0)
restricoes_4 = c(0,0,1,1,0,0)
restricoes_5 = c(0,0,0,1,1,0)
restricoes_6 = c(0,0,0,0,1,1)

restricoes   = rbind(restricoes_1, restricoes_2, restricoes_3,
                     restricoes_4, restricoes_5, restricoes_6)

disponibilidade = c(5,7,18,12,15,10)

library(linprog)
solveLP(f_obj, disponibilidade, restricoes, FALSE,
        const.dir = c ( ">=", ">=", ">=", ">=", ">=", ">="))
##############################################################################

##############################################################################
# exemplo livro pag. 69
# Minimize
# cost: 5h1 +  5h2 +  5h3 +  5h4 +  5h5 +  5h6 + 
#      10f1 + 10f2 + 10f3 + 10f4 + 10f5 + 10f6 + 
#       8s1 +  8s2 +  8s3 +  8s4 +  8s5 +  8s6

# Subject To
# sini: s0 = 20
# sm1: s0 + h1 - f1 - s1 = 0
# sm2: s1 + h2 - f2 - s2 = 0
# sm3: s2 + h3 - f3 - s3 = 0
# sm4: s3 + h4 - f4 - s4 = 0
# sm5: s4 + h5 - f5 - s5 = 0
# 10 sm6: s5 + h6 - f6 - s6 = 0

# Bounds
# 30 <= s1
# 60 <= s2
# 55 <= s3
# 40 <= s4
# 45 <= s5
# 50 <= s6

f_obj = c(5,5,5,5,5,5,10,10,10,10,10,10,8,8,8,8,8,8)

restricoes_1 = c(1,0,0,0,0,0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0)
restricoes_2 = c(0,1,0,0,0,0,  0,-1, 0, 0, 0, 0,  1,-1, 0, 0, 0, 0)
restricoes_3 = c(0,0,1,0,0,0,  0, 0,-1, 0, 0, 0,  0, 1,-1, 0, 0, 0)
restricoes_4 = c(0,0,0,1,0,0,  0, 0, 0,-1, 0, 0,  0, 0, 1,-1, 0, 0)
restricoes_5 = c(0,0,0,0,1,0,  0, 0, 0, 0,-1, 0,  0, 0, 0, 1,-1, 0)
restricoes_6 = c(0,0,0,0,0,1,  0, 0, 0, 0, 0,-1,  0, 0, 0, 0, 1,-1)

restricoes_7  = c(0,0,0,0,0,0, 0,0,0,0,0,0,  1,0,0,0,0,0)
restricoes_8  = c(0,0,0,0,0,0, 0,0,0,0,0,0,  0,1,0,0,0,0)
restricoes_9  = c(0,0,0,0,0,0, 0,0,0,0,0,0,  0,0,1,0,0,0)
restricoes_10 = c(0,0,0,0,0,0, 0,0,0,0,0,0,  0,0,0,1,0,0)
restricoes_11 = c(0,0,0,0,0,0, 0,0,0,0,0,0,  0,0,0,0,1,0)
restricoes_12 = c(0,0,0,0,0,0, 0,0,0,0,0,0,  0,0,0,0,0,1)

restricoes   = rbind(restricoes_1, restricoes_2, restricoes_3,
                     restricoes_4, restricoes_5, restricoes_6,
                     restricoes_7, restricoes_8, restricoes_9,
                     restricoes_10, restricoes_11, restricoes_12)

disponibilidade = c(-20,0,0,0,0,0,30,60,55,40,45,50)

library(linprog)
solveLP(f_obj, disponibilidade, restricoes, FALSE,
        const.dir = c ( "==", "==","==","==","==","==",
                        ">=", ">=", ">=", ">=", ">=", ">="),
        lpSolve = TRUE)
##############################################################################



