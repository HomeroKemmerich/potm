#
#               lucro (R$)  área (m^2)  tempo
# soleira       7.00        0.6         24 min
# peitoril      8.00        0.8         20 min
# disponível    -           16          5 * 6 h

restrictions = rbind(
    c(0.6, 0.8),
    c(24, 20)
)

availability = c(16, 5 * 6 * 60)

revenue = c(7, 8)

result = simplex(revenue, restrictions, availability, maxi=TRUE)

print(result)