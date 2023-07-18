require(ISLR)
names(Smarket)
summary(Smarket)
?Smarket
pairs(Smarket,col=Smarket$Direction) #pairplot is created

#Logistic Regression
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family = binomial)
summary(glm.fit) #none of the predictors are significant
glm.probs = predict(glm.fit, type = "response")
length(glm.probs)
glm.probs[1:5]
glm.pred=ifelse(glm.probs>0.5,"Up","Down") #if else is used
attach(Smarket)
table(glm.pred,Direction) #Creating the true vs prediction table
mean(glm.pred==Direction) #proportion of our succes which is slightly more than chance

# Make trainin and test set
train = Year<2005 
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data = Smarket, family = binomial, subset = train) #we added the subset feature
glm.probs = predict(glm.fit,newdata=Smarket[!train,], type ="response")
glm.pred=ifelse(glm.probs>0.5,"Up","Down")
Direction.2005=Smarket$Direction[!train]
table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005) #we are now behind chance we may be overfitting

# Fit smaller model
glm.fit=glm(Direction~Lag1+Lag2,data=Smarket,family = binomial, subset = train)
glm.probs = predict(glm.fit, newdata = Smarket[!train,], type ="response")
glm.pred=ifelse(glm.probs>0.5,"Up","Down")
Direction.2005=Smarket$Direction[!train]
table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005) #now we have a better model
106/(106+35) #for the True Positive ratio
35/(35+76) #for the True Negative ratio

require(ISLR)
require(MASS)

### Linear Discriminant Analysis
lda.fit=lda(Direction~Lag1+Lag2, data=Smarket, subset=Year<2005)
lda.fit
plot(lda.fit)
Smarket.2005=subset(Smarket,Year==2005)
lda.pred = predict(lda.fit, Smarket.2005)
lda.pred[1:5,] #does not work 
class(lda.pred) #so we check the type of lda.pred and see it is a list
data.frame(lda.pred)[1:5,] #here we convert into a dataframe
table(lda.pred$class,Smarket.2005$Direction)
mean(lda.pred$class==Smarket.2005$Direction) #here we have a better model than the logistic regression it is still not much but in this industry it is something

106/(35+106) 
35/(76+35)


### K-Nearest Neighbours

# Some says knn does the best 1/3 of the time

library(class)
?knn #has a different formula than glm or lda
attach(Smarket)
xlag=cbind(Lag1,Lag2) # makes two columns a matrix
train=Year<2005
knn.pred=knn(xlag[train,],xlag[!train,],Direction[train],k=1)
table(knn.pred,Direction[!train])
mean(knn.pred==Direction[!train]) # no better than flipping a coin 
#one can look for more k values
knn.pred=knn(xlag[train,],xlag[!train,],Direction[train],k=5)
table(knn.pred,Direction[!train])
mean(knn.pred==Direction[!train])

