#Apriori

#Data preprocessing
dataset=read.csv('Market_Basket_Optimisation.csv',header=FALSE)

#install.packages('arules')
library(arules)
dataset=read.transactions('Market_Basket_Optimisation.csv',sep=',',rm.duplicates=TRUE)
summary(dataset)

itemFrequencyPlot(dataset,topN=100)

#Training the Apriori on the Dataset
#rules=apriori(dataset,parameter=list(support=0.003,confidence=0.8)) 
#rules=apriori(dataset,parameter=list(support=0.003,confidence=0.4)) 
#rules=apriori(dataset,parameter=list(support=0.003,confidence=0.2)) 
rules=apriori(dataset,parameter=list(support=0.004,confidence=0.2)) 

#visualsing the results 
inspect(sort(rules,by='lift')[1:10])