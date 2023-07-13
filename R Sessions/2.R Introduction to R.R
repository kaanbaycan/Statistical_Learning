### vectors, data, matrices, subsetting
x=c(2,7,5) #vector creation
x
y=seq(from = 4, length = 3, by = 3)
y
?seq #to get help
x+y
x*y
x/y
x**y
x[2]
x[2:3]
x[-2] #removing the second element and getting the rest
x[-c(1,2)]
z=matrix(seq(1,12),4,3) #creating a 4 by 3 matrix
z[3:4,2:3]
z[,2:3]
z[,1]
z[,1,drop=FALSE]#if drop = True, matrix becomes a vector
dim(z)
ls() #seeing variables
rm(y) #removing variables

### Generating random data, graphics
x=runif(50) #generating a uniform data
y=rnorm(50) #generating a gaussian data
plot(x,y)
plot(x,y, xlab ="x", ylab = "y", pch="*",col="blue")
par(mfrow = c(2,1)) #Panel of plots with 2 rows and 1 column
plot(x,y)
hist(y)
par(mfrow=c(1,1)) #reset, it stays same otherwise

### Reading in data
Auto=read.csv("C:/Users/yakup/Desktop/Data Science/R/Auto.csv")
names(Auto) #getting the col names
dim(Auto) #getting the dimension
class(Auto) #getting the type
summary(Auto) #getting the statistics related to columns
plot(Auto$cylinders,Auto$mpg, xlab="clyinder", ylab="mpg")
attach(Auto) #now we can use it without referring to Auto
search() #we can see the packages 
plot(cylinders, mpg)
cylinders=as.factor(cylinders)
cylinders
rm(x)
rm(y)
