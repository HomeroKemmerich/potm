# A empresa Açobom fabrica três produtos (Pl, P2 e P3) utilizando quatro máquinas: corte,
# solda, dobra e embalagem. Na fabricação do produto Pl, para cada unidade fabricada,
# gastam-se 3 minutos no corte, 4 na solda, 2 na dobra e 1 na embalagem. Na fabricação do
# produto P2 são necessários 3, 3, 1 e 0,5 minutos, respectivamente, nas máquinas de
# corte, solda, dobra e embalagem, e para a fabricação do produto P3, na mesma ordem das
# máquinas anteriormente enumeradas, 2, 1,5, 2 e 1. Para a fabricação desses produtos são
# utilizados laminados de aço padronizados, sendo que o produto Pl gasta 2,0 metros, o P2
# gasta 1,8 metro e o P3 gasta 1,8 metro. A quantidade disponível de laminado é de 125
# metros e as máquinas que fazem o corte, a solda, a dobra e a embalagem têm
# disponibilidades totais de 150, 126, 130 e 70 horas, respectivamente Levando-se em
# consideração que a contribuição para o lucro de uma unidade de Pl é de $ 38,00, de P2 é
# de $ 36,00 e de P3 é de $ 30,00, deseja-se saber qual deverá ser a produção que
# maximizará o lucro da empresa.
#
#                   corte       solda       dobra   embalagem   material (m)    contribuição (R$)
# P1                3 min       4.0 min     2 min    1.0 min    2.0             38.00
# P2                3 min       3.0 min     1 min    0.5 min    1.8             36.00
# P3                2 min       1.5 min     2 min    1.0 min    1.8             30.00
# Disponibilidade   150 h       126 h       130 h    70 h       125             -
#       

# Restrições
cutting_time_restrictions = c(3, 3, 2)
soldering_time_restrictions = c(4, 3, 1.5)
folding_time_restrictions = c(2, 1, 2)
packaging_time_restrictions = c(1, 0.5, 1)
material_restrictions = c(2, 1.8, 1.8)

restrictions = rbind(
    cutting_time_restrictions,
    soldering_time_restrictions,
    folding_time_restrictions,
    packaging_time_restrictions,
    material_restrictions
)

# Disponibilidade

sixty_minutes = 60

cutting_availability = sixty_minutes * 150
soldering_availability = sixty_minutes *  126
folding_availability = sixty_minutes * 130
packaging_availability = sixty_minutes * 70
material_availability = 125

availability = c(
    cutting_availability,
    soldering_availability,
    folding_availability,
    packaging_availability,
    material_availability
)

revenue = c(38, 36, 30)

result = simplex(revenue, restrictions, availability, maxi = TRUE)

print(result)
