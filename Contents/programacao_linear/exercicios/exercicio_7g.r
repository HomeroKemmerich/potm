# material      tonalidade 1    tonalidade 2    tonalidade 3    disbonibilidade
# tinta db      0.40            0.45            0.50            55.5
# tinta w       0.30            0.25            0.15            16
# solvente      0.15            0.10            0.10            35.5
# base          0.15            0.20            0.25            23
#
# lucro (R$)    12.00           13.80           14.50

restrictions = rbind(
    c(0.40, 0.45, 0.50),
    c(0.30, 0.25, 0.15),
    c(0.15, 0.10, 0.10),
    c(0.15, 0.20, 0.25)
)

availability = c(55.5, 16, 35.5, 23)

revenue = (12.00, 13.80, 14.50)

result = simplex(revenue, restrictions, availability, maxi=TRUE)

print(result)