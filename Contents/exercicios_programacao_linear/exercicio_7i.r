#   peça                tecido (m)  tempo   min. máx. lucro (R$)
#   camiseta            1.10        14 min  0    500  4.56
#   boné                0.45        11 min  60   0    3.50
#   calção              1.20        10 min  0    100  4.60
#
#   disponibilidades    748         25 * 6 h

restrictions = rbind(
    c(1.10, 0.45, 1.20),    # tecido
    c(14, 11, 10),          # tempo 
    c(1, 0, 0),             # máx. camisetas
    c(0, 1, 0),             # mín. bonés
    c(0, 0, 1)              # máx. calções    
)

availability = c(748, 25*6*60, 500, 60, 100)

revenue = c(4.56, 3.50, 4.60)

result = simplex(revenue, restrictions, availability, maxi=TRUE)

print(result)