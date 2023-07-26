### Chapter 2 Applied Exercises

## 8

list.files() #to see the files in the current directory

data = read.csv("College.csv")

View(data)

rownames(data) <- data[,1] # R now have the first colum as the row names, so will not make calculations with it

View(data)

data <- data[,-1] #deleting the first column

View(data)

summary(data)
fix(data)
data$Private <- as.factor(data$Private)
pairs(data[,1:11],)

boxplot(data$Outstate~data$Private, col="steelblue", xlab = "Private School", ylab = "Outstate")

Elite <- rep("No", nrow(data))
Elite[data$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
data <- data.frame(data,Elite)
summary(data) #so there are 78 elite universities

boxplot(data$Outstate~data$Elite,xlab = "Elite School", ylab = "Outstate")
par(mfrow = c(2,2))
hist(data$Outstate, xlab = "Out of State Tuition") #slighltly right skewed, log transformation may be useful
hist(data$Books, xlab = "Book Cost") #highly right skewed, log transformation is a must
hist(data$S.F.Ratio, xlab = "Student/Faculty Ratio") #there are some outliers
hist(data$Grad.Rate, xlab = "Graduation Rate") #pretty close to normal distribution

par(mfrow = c(1,1))

boxplot(data$Books~data$Elite, ylab = "Book Cost", xlab = "Elite School") 

Acceptance_rate = data$Accept/data$Apps
data <- data.frame(data, Acceptance_rate)

boxplot(data$Acceptance_rate~data$Elite, xlab = "Elite School", ylab="Acceptance Rate")

Mid_level <- rep("No", nrow(data))
Mid_level[data$Top25perc > 50 & data$Elite == "No"] <- "Yes"
Mid_level <- as.factor(Mid_level)
data <- data.frame(data,Mid_level)
summary(data) #so there are 78 elite universities

View(data)
par(mfrow = c(1,2))

School_level = ifelse(data$Mid_level == "Yes" & data$Elite == "No", "Mid-level",ifelse(data$Mid_level == "No" & data$Elite =="Yes", "Elite", NA))

School_level[is.na(School_level)]<-"Low-level"
School_level
data <- data.frame(data,School_level)
data$School_level <- as.factor(data$School_level)

par(mfrow = c(2,2))

plot(data$School_level, xlab = "School Type")

plot(data$Outstate ~data$School_level, 
     xlab = "School Level",
     ylab = "Outstate Fee($)")

plot(data$Acceptance_rate~data$School_level, xlab = "School Level", ylab="Acceptance Rate")

plot(data$S.F.Ratio ~ data$School_level, 
     xlab = "School Level",
     ylab = "Student/Faculty Ratio")

## 9

Auto = read.csv("Auto.csv")

View(Auto)

attach(Auto)

summary(Auto) # although horsepower has numeric values it's class is character so there is a problem

Auto$horsepower <- as.numeric(Auto$horsepower)

summary(Auto)

library(tidyr)

Auto = drop_na(Auto)

summary(Auto)

range(mpg)
range(cylinders)
range(displacement)
range(Auto$horsepower)
range(weight)
range(acceleration)
range(year)
range(origin)

summary(Auto)
sd(mpg)
sd(cylinders)
sd(displacement)
sd(horsepower)
sd(Auto$horsepower)
sd(weight)
sd(acceleration)
sd(year)
sd(origin)

Auto <- Auto[-10:-85,]


View(Auto)
summary(Auto)

sd(mpg)
sd(cylinders)
sd(displacement)
sd(Auto$horsepower)
sd(weight)
sd(acceleration)
sd(year)
sd(origin)
par(mfrow=c(2,2))
pairs(Auto[,1:8])
plot(Auto$horsepower~Auto$acceleration,
     xlab = "Acceleration",
     ylab = "Horsepower")
boxplot(Auto$horsepower, xlab = "Horsepower")
boxplot(Auto$displacement~Auto$cylinders,
        xlab = "Cylinders",
        ylab = "Miles per Galon")
boxplot(Auto$acceleration~Auto$cylinders,
        xlab = "Cylinder",
        ylab = "Acceleration")
