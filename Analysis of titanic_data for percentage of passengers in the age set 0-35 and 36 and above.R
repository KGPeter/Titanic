#Importing our file dataset
#To import we using the file.choose()
file <- "D:/R/Datasets/titanic_data"
titanic_data = read.csv(file = file.choose())

titanic_data

#Display summary statistics
#head() and tail()
head(titanic_data)
tail(titanic_data)

#Summary()
summary(titanic_data)
nrow(titanic_data)
#In this analysis we will solely work on the age column
summary(titanic_data$Age)

#To check if there are missing values in our data set
colSums(is.na(titanic_data))

#Since we have NA values. We need to deal with that
#Lets Familiarize with the data
#Let’s first apply the table function to see the count of all elements in our age column
table(titanic_data$Age)


#Replacing the missing values (NAs) with the mean
titanic_data1 <- titanic_data                                                         # Duplicate data frame
titanic_data1$Age[is.na(titanic_data1$Age)] <- mean(titanic_data1$Age, na.rm = TRUE)  # Replace NA in one column
titanic_data1 

nrow(titanic_data1)


hist(titanic_data1$Age)

#Selecting rows that equal to a condition
young_pop <- titanic_data1[titanic_data1$Age <= 35,]
older_pop <- titanic_data1[titanic_data1$Age > 35,]

nrow(young_pop)
nrow(older_pop)

#To check if nrow(young_pop) + nrow(older pop) == nrow(titanic_data1)
nrow(titanic_data1)

#To find a percentage of the young population <= 35 to the whole population
perc_young_pop <- sum(titanic_data1$Age <= 35)/length(titanic_data1$Age)

#To find a percentage of the young population > 35 to the whole population
perc_older_pop <- sum(titanic_data1$Age > 35)/length(titanic_data1$Age)

#Plotting a pie chart
x <- c(perc_older_pop, perc_young_pop)
labels <- c("older population", "young population")
piepercent<- round(100*x/sum(x), 1)
pie(x, labels=piepercent,
    main = "Titanic Population",col = rainbow(length(x)))
legend("topright", c("Older Population","Young Population"), cex = 0.8,
       fill = rainbow(length(x)))


#Plotting a 3-D pie chart
install.packages ('plotrix')
library(plotrix)  

pie3D(x, labels = pie_percent,
      explode = 0.1, 
      main = "3D pie-chart")
