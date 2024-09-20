# móvel             madeira (m^2)   parafusos   cola (kg)   puxadores   dobradiças  qtd. máx.   lucro (R$)
# estante           2.5             14          0.40        8           6           16          45         
# mesa              2.0             18          0.22        2           4           25          36
#
# disponibilidade   90              7 * 100     12          15 * 12     17 * 12     1

restrictions = rbind(
    c(2.5, 2.0),    # madeira
    c(14, 18),      # parafusos
    c(0.40, 0.22),  # cola
    c(8, 2),        # puxadores
    c(6, 4),        # dobradiças
    c(1, 0),        # máximo de estantes
    c(0, 1)         # máximo de mesas
)


availability = c(90, 7*100, 12, 15*12, 17*12, 16, 25)

revenue = c(45, 36)

result = simplex(revenue, restrictions, availability, maxi = TRUE)

print(result)