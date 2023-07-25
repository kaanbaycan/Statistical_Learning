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
pairs(data[,2:12],)

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
