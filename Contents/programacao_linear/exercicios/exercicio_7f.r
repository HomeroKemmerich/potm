#
# jogo              peças A peças B peças C tempo   preço(R$)
# plim              2       -       3       3 min   4.80
# plam              -       3       4       3.5 min 5.10
# plum              2       2       4       5 min   6.00
#
# disponibilidade   3000    5400    8100    16 * 6 h

restrictions = rbind(
    c(2, 0, 2),
    c(0, 3, 2),
    c(3, 4, 4),
    c(3, 3.5, 5)
)

availability = c(3000, 5400, 8100, 16*6*60)

revenue = c(4.80, 5.10, 6.00)

result = simplex(revenue, restrictions, availability, maxi=TRUE)

print(result)