dataset=read.csv(file.choose(),header =TRUE)

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

dataset$State

install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Profit ~ .,data = training_set)
y_pred = predict(regressor, newdata = test_set)

plot(dataset$Profit,dataset$Marketing.Spend)

model <- lm(Marketing.Spend ~ Profit, data=dataset)

summary(model)

abline(model, col="red")
