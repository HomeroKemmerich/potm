#load package
library(reshape2) #dcast() #reformatting table
library(fossil) #dino.mst() #mst function

#create a data frame with coordinates x and y and distance
dat <- data.frame(x=c(1,1,1,1,2,2,2,3,3,4),
                  y=c(1,2,3,4,2,3,4,3,4,4),
                  distance=c(0,0.2,0.5,0.1,0,0.5,0.8,0,0.1,0))

#convert to wide format
x <- dcast(dat,y~x,value.var="distance")

#remove first column
x <- x[,-1]

#convert to a dist object
x <- as.dist(x)
#this dist object can be used in any function that accepts a dist object.

#calculate mst
(mstobj <- dino.mst(x))
