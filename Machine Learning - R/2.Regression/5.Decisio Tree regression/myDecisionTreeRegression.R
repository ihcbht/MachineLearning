dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


#install.packages('rpart')
library(rpart)
regressor=rpart(formula=Salary~.,
                data=dataset,
                control=rpart.control(minsplit=1))


# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))



# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Model)') +
  xlab('Level') +
  ylab('Salary')

