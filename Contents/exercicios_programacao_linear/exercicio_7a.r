# A Empresa Afia Bem Ltda. produz na Seção B três modelos de facas: a Padrão (P), a
# Média (M) e a Grande (G). No processo de fabricação das facas são utilizadas,
# primeiramente, três máquinas que fazem o corte da lâmina, a modelagem e a afiação.
# Uma quarta máquina faz o cabo das facas e uma quinta faz a montagem. Os tempos, em
# segundos, gastos em cada máquina são a seguir especificados:
#
#           corte   modelagem   afiação cabo    montagem
# padrão    10      10          12      19      19
# médio     10      15.5        16      21      21
# grande    12      17          19      24      22
# 
# Os tempos disponíveis, diariamente, de cada máquina são de 4 horas para o corte, 6 horas
# para a modelagem, 6 horas para a afiação, 8 horas para o cabo e 8 horas para a
# montagem. Uma faca do modelo Padrão tem uma lâmina de 25 cm2, uma do modelo
# Médio tem 32 cm2 e uma do modelo Grande, 45cm2. Cada chapa metálica que dá origem
# às lâminas tem 2,00 m x 1,00 m. A disponibilidade diária de chapas metálicas é de 2,5
# chapas. As contribuições para os lucros são de $ 3,20, $ 4,00 e $ 4,70 unidades
# monetárias para os modelos Padrão, Médio e Grande, respectivamente. Deseja-se
# formular o modelo para calcular as quantidades a serem produzidas dos tipos Padrão,
# Médio e Grande que maximizem o lucro da empresa.

library(linprog)

# Restrições
cutting_time_restrictions = c(10, 10, 15)
modelling_time_restrictions = c(10, 15.5, 17)
sharpening_time_restrictions = c(12, 16, 19)
handle_time_restrictions = c(19, 21, 24)
assembling_time_restrictions = c(19, 21, 22)
metal_restrictions = c(25, 32, 45)

restrictions = rbind(
    cutting_time_restrictions,
    modelling_time_restrictions,
    sharpening_time_restrictions,
    handle_time_restrictions,
    assembling_time_restrictions,
    metal_restrictions
)

# Disponibilidades
metal_sheet = 100 * 200
available_metal_sheets = 2.5 * metal_sheet

sixty_seconds = 60
sixty_minutes = 60 * sixty_seconds

four_hours = 4 * sixty_minutes
six_hours = 6 * sixty_minutes
eight_hours = 8 * sixty_minutes

availability = c(four_hours, six_hours, six_hours, eight_hours, eight_hours, available_metal_sheets)

# Lucro por peça
revenue = c(3.20, 4.00, 4.70)

result = simplex(revenue, restrictions, availability, maxi = TRUE)

print(result)
