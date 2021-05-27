View(EastWestAirlines)
mydata <- EastWestAirlines[c(-1,-11)]
mydata
str((mydata))
summary(mydata)
normalized_data <- scale(mydata)
View(normalized_data)

d <- dist(normalized_data, method = "euclidean") # distance matrix
fit <- hclust(d, method="centroid") 
fit
plot(fit)
plot(fit, hang=-1)
groups <- cutree(fit, k=3)
rect.hclust(fit, k=3, border="red")

table(groups)
#dendrogram not interpretable
#go for k means


library(plyr)
km=kmeans(normalized_data,10)
str(km)
km$cluster
km$centers


install.packages("animation")
library(animation)
km<-kmeans.ani(normalized_data,10)

#lets find out what to choose as k
install.packages("kselection")
library(kselection)
k<-kselection(normalized_data,parallel = TRUE)
k


<-as.matrix(groups)
View(crimerate)
g1 = aggregate(normalized_data,list(groups),median)
data.frame(Cluster=g1[,1],Freq=as.vector(table(groups)),g1[,-1])
