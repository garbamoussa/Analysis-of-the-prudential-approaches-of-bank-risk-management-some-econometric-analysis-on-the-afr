
#repos = https://cran.cnr.berkeley.edu
## how to install R with MacOS , windows
#https://courses.edx.org/courses/UTAustinX/UT.7.01x/3T2014/56c5437b88fa43cf828bff5371c6a924/

# import la librairie readxl
library(readxl)
# importer data en indiquant le path 
data <- read_excel("/Users/garbamoussa/Desktop/Data/PanelBankAfrique20012_2005.xlsx")
# Afficher les noms de colonnes 
names(data)


# Create a vector.
apple <- c('red','green',"yellow")
print(apple)

# Get the class of the vector.
print(class(apple))


# install.packages("tidyverse")
# install.packages("funModeling")
# install.packages("Hmisc")
any(grepl("xlsx",installed.packages()))

# simple installation d'un package sur R 
install.packages("readxl", repos = "https://cran.rstudio.com")
install.packages("xlsx", repos = "https://cran.rstudio.com")
install.packages("data.table", repos='http://cran.us.r-project.org')


# Déplacer le fichier .csv vers /Users/garbamoussa(ggetw() de R)
mv Data_Forest1.csv /Users/garbamoussa

# importer de fichiers excel xlsx et une quantité massive 
 install.packages("readxl", repos = "https://cran.rstudio.com")
 
 test_data <- read_excel("test_data1.xlsx", 1)
 # Régression linéaire et la fonction predict
 
 x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
 y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
 relation <- lm(y~x)
 print(summary(relation))
 a <- data.frame(x = 170)
 
 result <-  predict(relation,a)
 
 ##### regression linéaire et la répresentation graphique 
 # Create the predictor and response variable.
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
relation <- lm(y~x)

# Give the chart file a name.
png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

# Save the file.
dev.off()

install.packages("readxl")

 install.packages("ggplot2")
install.packages("ggplot2", repos = "https://cran.rstudio.com")

install.packages("readxl", repos = "https://cran.rstudio.com")

data <- na.omit(read_excel("/Users/garbamoussa/Desktop/Data/PanelBankAfrique20012_2005.xlsx"))

librairy(readxl)


library(readxl)

data <- na.omit(read_excel("/Users/garbamoussa/Desktop/Data/PanelBankAfrique20012_2005.xlsx"))

install.packages("xlsx", repos = "https://cran.rstudio.com")

.libPaths

search()

Forest <- read.csv("Data_Forest1.csv", sep="\t")


Forest <- read.csv("Data_Forest1.csv", header=TRUE, na.strings="NA", sep="\t")

## création d'une dataframe permettant les banques qui satisfont aux deux conditions
info <- subset(data, RS > 8 & Banques == "Alubaf International Bank")

## A révoir une erreur possible
data_2010 <- subset(data, as.Date(Year) > as.Date("2010"))

##
write.csv(info,"output.csv")
newdata <- read.csv("output.csv")
newdata
## Supprimer le X du début de info
write.csv(info,"output.csv", row.names = FALSE)
newdata <- read.csv("output.csv")
newdata

##
any(grepl("xlsx",installed.packages()))


install.packages("xlsx", repos = "https://cran.rstudio.com")

##

test_data <- read_excel("test_data1.xlsx", 1)


install.packages("RMySQL", repos = "https://cran.rstudio.com")

names(data)
model <- lm(MNI~CP+RS+RC+RL+RL+TA, data=data)
model

## Afficher la première ligne du tableau de résultat de la regression (la constante )

a <- coef(model)[1]
## Afficher le résume de résultat de la régression et la siggnificativité des estimanteurs ainsi que  les pVALUE, std.Error

print(summary(model))

## création d'un nouveau dataframe composé de variables explicatives
newdata  <- data.frame(CP=0.045, RS=0.65, RC=0.987, RL=0.765, TA=109823)

## Prévision de la variable à expliquer, appel de la function predict en lui attribuant deux élements : model et newdata

predict(model, newdata)
## importer la librairie party ou rparty
library(party)

##
mydata <- read.table("timeserieafrica1.txt", sep="\t", header=TRUE,  fileEncoding="CP1252")

sapply(data,mode)

sapply(data,class)


new_data <- na.omit(data)
##Amelia II: A Program for Missing Data
### https://gking.harvard.edu/amelia
install.packages("Amelia", repos="http://r.iq.harvard.edu", type = "source")

##mitools: Tools for multiple imputation of missing data
##http://cran.cnr.berkeley.edu/web/packages/mitools/index.html
##
