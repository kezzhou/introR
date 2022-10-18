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

# species <- c("ecoli", "human", corn) ## in this case we get an error because there are no quotations around corn

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

glengths <- c(glengths, 90) # adding at the end	

glengths <- c(30, glengths) # adding to beginning

## modifying whether glengths comes first or last in a vector function can will whether it is added to the front of end

sqrt(81)

sqrt(glengths) ## applying a mathetical function to a vector will apply it to each element

round(3.14159) ## rounding to nearest whole number

?round ## get the description of a function by preceding it with '?'

args(round) ## get the arguments of a function that you know the name of

example("round") ## look at examples of how to execute a function

round(3.14159, digits=2) ## round to two digits based on the 'digits' argument

round(3.14159, 2) ## you can achieve the same effect without naming arguments if presented in the exact order. this may increase speed but potentially reduces readability for others viewing the code.

mean(glengths)

test <- c(1, NA, 2, 3, NA, 4)

?mean

mean(test, na.rm=TRUE)

sort(glengths)

square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5)

## you do not need to include 'return()' at the end when defining a function but it is regarded as best practice

multiply_it <- function(x, y) {
  product <- x * y
  return(product)
}

multiply_it(4, 6)



## Module 1.4: Data subsetting with base R: vectors and factors ##

?read.csv ## this brings up documentation for read.table because it is the parent function

metadata <- read.csv(file="./mouse_exp_design.csv")

proj_summary <- read.table(file="./project-summary.txt", header=TRUE) ## the header argument will set the first row as variable names when set to TRUE

head(metadata)

class(glengths) 

class(metadata)

## class reports on the datatypes of the elements of glengths vector but on the entirety of metadata as a dataframe. Therefore the output for class(metadata) is data.frame

summary(proj_summary) ## median for rRNA_rate is 0.005082

length(samplegroup)

dim(proj_summary) ## 9 col by 9 rows

