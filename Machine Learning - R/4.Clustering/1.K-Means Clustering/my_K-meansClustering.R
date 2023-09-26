dataset<-read.csv("mall.csv")
X<-dataset[4:5]

#using the elbow method to find optimal nummber of clusters
set.seed(6)
wcss<-vector()
for(i in 1:10) wcss[i]<-sum(kmeans(X,i)$withinss)
plot(1:10,
     wcss,
     type="b",
     main=paste('Cluster of Clients'),
     xlab="Number of clusters",
     ylab="WCSS")

#applying kmeans to the mall dataset
set.seed(29)
kmeans<-kmeans(X,5,iter.max=300,nstart=10)

#visualizing thye cluster
#install.packages("cluster")
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines=0,
         shade=TRUE,
         color=TRUE,
         labels=2,
         plotchar=FALSE,
         span=TRUE,
         main=paste("cluster of clients"),
         xlab="Annual Income",
         ylab="Spending Score")