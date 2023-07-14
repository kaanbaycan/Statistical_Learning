library(MASS) #to get the dataset
library(ISLR) #getting the course library

### Simple Linear Regression
names(Boston) #calling the columns of dataframe Boston
?Boston
plot(medv~lstat, data = Boston) #median value of homes in $1k's vs lower status of population
fit1=lm(medv~lstat, data = Boston) #fitting a linear model with medv and lstat
fit1
summary(fit1) #brings the models statistics
abline(fit1, col="red") #adding the line into the plot
names(fit1) #to see the components of model
confint(fit1) #finds the confidence interval with default alpha=5%
predict(fit1, data.frame(lstat=c(5,10,15)), interval = "confidence") #predicting values for given x with the confidence interval

### Multiple linear regression
fit2=lm(medv~lstat+age, Boston) #features being lstate and age
summary(fit2)
fit3=lm(medv~.,Boston) #all of the features are used
summary(fit3) #age was signficant in the fit2 model with the lstat but with all of the variables it loses its significance
par(mfrow=c(2,2))
plot(fit3)
fit4=update(fit3,~.-age-indus)
summary(fit4)

### Nonlinear terms and Interactions
fit5=lm(medv~lstat*age,Boston)
summary(fit5)
fit6=lm(medv~lstat + I(lstat^2),Boston); summary(fit6) #taking lstat's square as a feature
attach(Boston) #named variable in boston are now available
par(mfrow=c(1,1))
plot(medv~lstat)
points(lstat,fitted(fit6),col="red",pch=20) #pch is plotting character
fit7=lm(medv~poly(lstat,4))
points(lstat, fitted(fit7), col="blue", pch=20)
plot(1:20,1:20,pch=1:20,cex=2) #plotting characters from 1 to 20 (pch)

### Qualitative predictors
fix(Carseats) #we can see the data more clearly
names(Carseats)
summary(Carseats) #for categorical columns, gives a good valuecounts statistic
fit1=lm(Sales~.+Income:Advertising+Age:Price,Carseats)
summary(fit1)
contrasts(Carseats$ShelveLoc) #how are the column given as a dummy variable

### Writing R functions
regplot=function(x,y){
  fit=lm(y~x)
  plot(x,y)
  abline(fit,col="green")
}
attach(Carseats)
regplot(Price,Sales) 
regplot=function(x,y,...){ 
  fit=lm(y~x)
  plot(x,y,...)
  abline(fit,col="green")
}# by adding dots into bot plot and function, parameters of the function in the function can be specified from the outer function
regplot(Price,Sales,xlab="Price",ylab="Sales", col="blue",pch=20)