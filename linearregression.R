head(basket)
summary(basket)
plot(basket)
set.seed(2)
library(caTools)
install.packages("caTools")
library(caTools)
split <- sample.split(basket,SplitRatio=0.7)
split
train <- subset(basket,split="TRUE")
test <- subset(basket,split="FALSE")
train
# Create the model
Model <- lm(Successfulgoals~.,data=train)
summary(Model)
# Prediction
pred <- predict(Model , test)
pred
# Comparing predicted vs actual values
plot(test$Successfulgoals,type="l",lty=1.8,col="red")
lines(pred,type="l",col="blue")
plot(pred,type="l",lty=1.8,col="blue")
rmse <- sqrt(mean(pred~basket$Successfulgoals)^2)
rmse
