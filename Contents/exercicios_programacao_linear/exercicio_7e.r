#   
# modelos           tempo oficina I tempo oficina II    demanda lucro (R$)
# padrão            1 h             2.5 h               -       38.00
# clássico          1.5 h           2.5 h               40      49.00
#
# disponibilidade   20 * 8 h        32 * 8 h
#

# ? O que a restrição c(0, 1) faz?
# Ela diz que a produção do produto padrão deve ser no mínimo 40 unidades, mas não impõe um máximo. A função simplex tenta maximizar o lucro, então, se produzir mais do produto padrão aumentar o lucro (respeitando as outras restrições), o algoritmo pode escolher produzir mais.
restrictions = rbind(
    c(1.0, 1.5),
    c(2.5, 2.5), 
    c(0, 1)     
)

availability = c(20 * 8, 32 * 8, 40)

revenue = c(38, 49)

result = simplex(revenue, restrictions, availability, maxi=TRUE)

print(result)