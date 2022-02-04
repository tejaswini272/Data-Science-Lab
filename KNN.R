data(iris)
str(iris)

install.packages("e1071")
install.packages("caTools")
install.packages("class")
install.packages("caret")

library(e1071)
library(caTools)
library(class)
library(caret)

data(iris)
head(iris)

# Splitting into train and test data
split <- sample.split(iris, SplitRatio = 0.7)
train_cl <- subset(iris, split == "TRUE")
test_cl <- subset(iris, split == "FALSE")

#Scaling
train_scale <- scale(train_cl[, 1:4])
test_scale <- scale(test_cl[, 1:4])

# Fitting the training dataset
classifier_knn <- knn(train = train_scale,test = test_scale,cl = train_cl$Species,k = 1)
classifier_knn

# Confusiin Matrix
cm <- table(test_cl$Species, classifier_knn)
cm
plot(cm)

# evaluvating and clculating out of error
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# K = 3
classifier_knn <- knn(train = train_scale, test = test_scale, cl = train_cl$Species,k = 3)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# K = 5
classifier_knn <- knn(train = train_scale,test = test_scale,cl = train_cl$Species,k = 5)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

#precision
pr=cm[1,1]/sum(cm[,1])
pr

#recall
recall=cm[1,1]/sum(cm[1,])
recall
