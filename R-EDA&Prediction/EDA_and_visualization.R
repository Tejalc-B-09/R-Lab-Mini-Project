library(randomForest)
library(caret)

filename="C:\\Users\\Tejal Chaudhary\\Desktop\\R-EDA&Prediction\\diabetes_data.csv"
datasetRaw = read.csv(filename)
print(head(datasetRaw))

numColumns = dim(datasetRaw)[2]
vector_NAs = rep(0, numColumns)               
for (i in 1:numColumns) {
  vector_NAs[i] = sum(is.na(datasetRaw[,i]))
  
}
print("The missing values in each column:")
print(vector_NAs)

dataset = datasetRaw[,-c(1,7,15,16)]
print(dim(dataset))

row.has.na <- apply(dataset, 1, function(x){any(is.na(x))})
dataset = dataset[!row.has.na,]
print(dim(dataset))
print(head(dataset))

dataset[,5] = ifelse(dataset[,5] >= 7.0, 1, 0)
dataset[,5] = factor(dataset[,5]) #class label must be factor type

dataset[,7] = ifelse(dataset[,7] == "female", 0, 1)
dataset[,7] = factor(dataset[,7])

dataset[,10] = ifelse(dataset[,10] == "small", 0, ifelse(dataset[,10] == "medium", 1,2) )
dataset[,10] = factor(dataset[,10])

print(head(dataset, n=20))

print(dim(dataset))

print(sapply(dataset,class))

y = dataset$glyhb
print(cbind(freq=table(y),percentage=prop.table(table(y))*100))
print(table(y))
print(table(y)/length(y))

print(summary(dataset))

std=sapply(dataset[,-c(5,7,10)],sd) 
print('The standard deviations are:')
print(std)

# Skewness
library(e1071) 
skew=apply(dataset[,-c(5,7,10)], 2, skewness) 
print(skew)

# Correlations
correlations=cor(dataset[,-c(5,7,10)])
print(correlations)

# Data visualizations
dataset_numeric = dataset[,-c(5,7,10)]
#Histograms
par(mfrow=c(3,4)) # put four figures in a row (2*4)
for (i in 1:12) {
  hist(dataset_numeric[,i],main=names(dataset_numeric)[i])
}
#Density Plots
par(mfrow=c(3,4))
for(i in 1:12) {
  plot(density(dataset_numeric[,i]), main=names(dataset_numeric)[i])
}
#Box And Whisker Plots
par(mfrow=c(3,4))
for(i in 1:12) {
  boxplot(dataset_numeric[,i], main=names(dataset_numeric)[i])
}
#Barplots, which is used to count the accurances for categorical attributes 
dataset_categorical = dataset[,c(5,7,10)]
par(mfrow=c(1,3))
for(i in 1:3) {
  counts <- table(dataset_categorical[,i]) # get the count for each categorical value
  name <- names(dataset_categorical)[i]
  barplot(counts, main=name)
}
#Missing data Plot
library(Amelia) # library for the function missmap
par(mfrow=c(1,1))
missmap(datasetRaw, col=c("red", "grey"), legend=FALSE)

#Multivariate Visualization 
library(corrplot) # for function corrplot()
correlations1=cor(dataset_numeric)
print(correlations1)
par(mfrow=c(1,1))
corrplot(correlations1, methods="circle")

# pair-wise scatterplots of the numeric attributes
par(mfrow=c(1,1))
pairs(dataset_numeric)
#Scatterplot Matrix By Class (use different color to distinguish different class)
par(mfrow=c(1,1))
pairs(dataset_numeric, col=dataset[,5])

#Density By Class
library(caret)
# load the data
data(iris)
# density plots for each attribute by class value
x <- dataset_numeric
y <- dataset[,5]
scales <- list(x=list(relation="free"), y=list(relation="free"))
par(mfrow=c(1,1))
featurePlot(x=dataset_numeric, y=dataset[,5], plot="density", scales=scales)
#Box And Whisker Plots By Class
featurePlot(x=dataset_numeric, y=dataset[,5], plot="box")

