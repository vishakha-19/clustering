View(crime_data)
mydata <- crime_data[,2:4]
mydata

normalized_data <- scale(mydata)
View(normalized_data)

d <- dist(normalized_data, method = "euclidean")
fit <- hclust(d, method="complete") 
fit
plot(fit)
plot(fit, hang=-1)

groups <- cutree(fit, k=3)
rect.hclust(fit, k=3, border="blue")

crimerate<-as.matrix(groups)
View(crimerate)

final <- data.frame(crime_data, crimerate)
View(final)

final1 <- final[,c(ncol(final),1:(ncol(final)-1))]
ncol(final)
View(final1)

library(plyr)
km=kmeans(normalized_data,3)
str(km)
km$cluster
km$centers


install.packages("animation")
library(animation)
km<-kmeans.ani(normalized_data,3)

#best k
install.packages("kselection")
library(kselection)
k<-kselection(normalized_data,parallel = TRUE)
k

km=kmeans(normalized_data,2)
str(km)
km$cluster
km$centers

km<-kmeans.ani(normalized_data,2)

#3 clusters can be formed using h clustering
#k means is giving best k as 2
