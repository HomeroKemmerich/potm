# 7b

work_hours_restrictions = c(0.3, 0.4, 0.3)
yeast_restrictions = c(0.08, 0.06, 0.05)
cheese_restrictions = c(0.0, 0.0, 0.45)
flour_restrictions = c(0.5, 0.5, 0.4)
milk_restrictions = c(0.4, 0.4, 0.5)
egg_restrictions = c(4, 3, 4)

restrictions = rbind(
    flour_restrictions, 
    egg_restrictions, 
    yeast_restrictions, 
    milk_restrictions, 
    work_hours_restrictions, 
    cheese_restrictions
)

availability = c(40, 23*12, 6, 34, 40, 4.5)

revenues = c(3.40, 3.00, 2.50)

result = simplex(revenues, restrictions, availability, maxi = TRUE)

print(result)
