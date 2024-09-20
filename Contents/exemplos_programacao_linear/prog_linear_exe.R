##############################################################################
# library(boot)
# simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
# #simplex(f_obj, rest1, disp1, rest2, disp2, rest3, disp3, maxi = TRUE)
# # ????1 <=              ????2 >=              ????3 =

# library(linprog)
# solveLP(f_obj, disponibilidade, restricoes, TRUE)
# solveLP(f_obj, disponibilidade, restricoes, TRUE, const.dir = c ( "<=", "<="))

##############################################################################

##############################################################################
# exe 7a
f_obj = c(3.20,4.00,4.70)
restricoes = rbind(c(10,10,12),c(10,15.5,17),c(12,16,19),
                   c(19,21,24),c(19,21,22),c(25,32,45))

sixty_seconds = 60;
sixty_minutes = 60;

one_hour = sixty_minutes * sixty_seconds;
hours = one_hour

cutting_time = 4 * hours
modelling_time = 6 * hours
sharpening_time = 6 * hours
handle_time = 8 * hours
assembling_time = 8 * hours

metal_sheet_width = 2.00
metal_sheet_length = 1.00
metal_sheet_area = metal_sheet_width * metal_sheet_length

available_metal_sheets = 2.5;

available_metal = available_metal_sheets * metal_sheet_area

disponibilidade = c(cutting_time, modelling_time, sharpening_time, handle_time, assembling_time, available_metal)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)

##############################################################################

##############################################################################
# exe 7b
f_obj = c(3.40,3.00,2.50)
restricoes = rbind(
        c(0.5,0.5,0.4),
        c(4,3,4),
        c(0.08,0.06,0.05),
        c(0.4,0.4,0.5),
        c(0,0,0.45),
        c(0.3,0.4,0.3)
)
disponibilidade = c(40,276,6,34,4.5,40)

resultado = simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
print(resultado)

##############################################################################

##############################################################################
# exe 7c
f_obj = c(38,36,30)
restricoes = rbind(c(3,3,2),c(4,3,1.5),c(2,1,2),c(1,0.5,1),c(2,1.8,1.8))
disponibilidade = c(9000,7560,7800,4200,125)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7d
f_obj = c(7,8.5)
restricoes_1 = c(0.6, 0.8)
restricoes_2 = c(24,20)
restricoes   = rbind(restricoes_1, restricoes_2)
disponibilidade = c(16,1800)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7e
f_obj = c(38,49)
restricoes_1 = c(1,1.5)
restricoes_2 = c(2.5,2.5)
restricoes_3 = c(0,1)
restricoes   = rbind(restricoes_1, restricoes_2, restricoes_3)
disponibilidade = c(160,256,40)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7f
f_obj = c(4.8,5.1,6)
restricoes_1 = c(2,0,2)
restricoes_2 = c(0,4,2)
restricoes_3 = c(3,3,4)
restricoes_4 = c(3,3.5,5)
restricoes   = rbind(restricoes_1, restricoes_2,
                     restricoes_3, restricoes_4)
disponibilidade = c(3000,5400,8100,5760)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7g
f_obj = c(12,13.8,14.5)
restricoes_1 = c(0.40,0.45,0.50)
restricoes_2 = c(0.30,0.25,0.15)
restricoes_3 = c(0.15,0.10,0.10)
restricoes_4 = c(0.15,0.20,0.25)
restricoes   = rbind(restricoes_1, restricoes_2,
                     restricoes_3, restricoes_4)
disponibilidade = c(55.5,35.5,16,23)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7h
f_obj = c(45,36)
restricoes_1 = c(2.5,2)
restricoes_2 = c(14,18)
restricoes_3 = c(0.40,0.22)
restricoes_4 = c(8,2)
restricoes_5 = c(6,4)
restricoes_6 = c(4.5,3)
restricoes_7 = c(1,0)
restricoes_8 = c(0,1)
restricoes   = rbind(restricoes_1, restricoes_2,
                     restricoes_3, restricoes_4,
                     restricoes_5, restricoes_6,
                     restricoes_7, restricoes_8)
disponibilidade = c(90,700,12,180,204,144,16,25)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7i
f_obj = c(4.56,3.50,4.60)
restricoes_1 = c(1.10,0.45,1.20)
restricoes_2 = c(14,11,10)
restricoes_3 = c(1,0,0)
restricoes_4 = c(0,1,0)
restricoes_5 = c(0,0,1)
restricoes   = rbind(restricoes_1, restricoes_2,
                     restricoes_3, restricoes_4,
                     restricoes_5)
disponibilidade = c(748,9000,500,60,100)

library(linprog)
solveLP(f_obj, disponibilidade, restricoes, TRUE,
        const.dir = c( "<=", "<=", "<=", ">=", "<=" ))
##############################################################################

##############################################################################
# exe 7j
f_obj = c(8.5, 9.0, 9.6)

restricoes = rbind(c(1,1,1),c(1,0,0),
                   c(0,1,0),c(0,0,1),c(1, -2, 0))

disponibilidade = c(4600, 3000, 1200, 900, 0)

simplex(f_obj, restricoes, disponibilidade, maxi = TRUE)
##############################################################################

##############################################################################
# exe 7k
f_obj = c(140, 80, 75, 160)
restricoes_1 = c(1, 1, 1, 1)
restricoes_2 = c(1, 1, 0, 0)
restricoes_3 = c(0, 0, 1 ,0)
restricoes_4 = c(0, 0, 1, 1)
restricoes   = rbind(restricoes_1, restricoes_2,
                     restricoes_3, restricoes_4)
disponibilidade = c(2000, 800, 400, 1000)

library(linprog)
solveLP(f_obj, disponibilidade, restricoes, TRUE,
        const.dir = c( "<=", ">=", ">=", "<=" ))
##############################################################################

##############################################################################
# exe 7l
f_obj = c(30, 0, 80, 0, 40, 50, 10) 

restricoes = rbind(c(1, 0, 0, 2, 0, 1, 1),
                   c(1, 0, 1, 0, 3, 0, 2),
                   c(1, 4, 2, 1, 0, 2, 0))

disponibilidade = c(450, 300, 150)

simplex(f_obj, A3 = restricoes, b3 = disponibilidade, maxi = TRUE)
##############################################################################

