

library(ggplot2)
getwd()
setwd("C:\Users\saimohan\Documents\Udemy")

#importing the dataset into a dataframe movies
movies<-read.csv("Movie-ratings.csv")

colnames(movies)

#Renaming the coloumn names of the movies data frame
colnames(movies)<-c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")

movies$Year<-factor(movies$Year)

#Plot showing the Audience Ratings and critic Ratings of differnt Genres
ggplot(data = movies,aes(x=Genre,y=AudienceRating))+geom_bar(stat = "summary",col="Black",fill="Dark Green")

ggplot(data = movies,aes(x=Genre,y=CriticRating))+geom_bar(stat = "summary",col="Black",fill=" Yellow")

#----Overriding aesthetics----Plot showing budget in millions and audience rating
q <-ggplot(data = movies, aes(x=CriticRating,y=AudienceRating,colour=Genre, 
                              size=BudgetMillions))
q + geom_point(aes(x=BudgetMillions))+xlab("Budget Millions $$$")


#-----Histograms-------
#Plot showing the distribution of various genres and budget in millions

s<-ggplot(data = movies,aes(x=BudgetMillions))

s+geom_histogram(binwidth =10, aes(fill= Genre), colour="Black")

#---------Density Plot------------

#Basic Density plot
s+geom_density()

s+geom_density(aes(fill=Genre), position = "Stack")

#------------Box plot and geom_jitter

u<-ggplot(data = movies, aes(x=Genre,y=AudienceRating,colour=Genre))
u+geom_boxplot(size=1.2)+geom_jitter()

u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)
u+geom_jitter()+
  geom_boxplot(size=1.2,alpha=0.5,aes(y=CriticRating))

#----------------Facets-----------

# Plot showing the critic rating and audience rating of different genres and different years

w<-ggplot(movies,aes(x=CriticRating,y=AudienceRating,col=Genre))


w+geom_point()

w+geom_point(aes(size=BudgetMillions))+facet_grid(Genre~Year)+geom_smooth()








