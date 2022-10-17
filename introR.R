#### Introduction to R and RStudio ####


## Module 1.1: Intro to R ##

getwd() ## allows us to view our current working directory

## oct 16, 2022

## interacting with R

## I am adding 3 and 5. R is fun!
3+5

x <- 3 

y <- 5

x + y

number <- x + y

number



## Module 1.2: R Syntax and Data Structures ##

glengths <- c(4.6, 3000, 50000) ## a vector with numeric types

glengths

species <- c("ecoli", "human", "corn") ## a vector with character types

species

## all elements of a vector must be the same type, or RStudio will convert it to the same type

species <- c("ecoli", "human", corn) ## in this case we get an error because there are no quotations around corn

expression <- c("low", "high", "medium", "high", "low", "medium", "high")

expression <- factor(expression) ## this will assign an integer to a factor level. this is assigned alphabetically based on the first letter of each element in the vector. in this case, high=1, low=2, and medium=3

samplegroup <- c("CTL", "KO", "OE", "OE", "CTL", "KO", "CTL", "OE", "KO")

samplegroup <- factor(samplegroup)

## matrices are made by stacking two or more vectors of the same length and datatype

## dataframes are similar to matrices in that the comprising vectors must be the same length, but they can have different datatypes.

df <- data.frame(species, glengths)

df

titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")

pages <- c(453, 432, 328)

df2 <- data.frame(titles, pages)

list1 <- list(species, df, number) ## we can organize various different data structures in a list

list1

list2 <- list(species, glengths, number)

list2



## Module 1.3: Functions in R ##

