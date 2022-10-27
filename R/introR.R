#### Introduction to R and RStudio ####




## Module 1.1: Introduction to R and RStudio ##

getwd() ## allows us to view our current working directory

## oct 16, 2022

## interacting with R

## I am adding 3 and 5. R is fun!
3+5

x <- 3 

y <- 5

x + y

number <- x + y

number # output 8


############

## Exercises
# Try changing the value of the variable x to 5. What happens to number?

x <- 5

number # output 10


# Now try changing the value of variable y to contain the value 10. What do you need to do, to update the variable number?

y <- 10

number

# you need to rerun the line defining number with function x + y

########################################################################



## Module 1.2: R Syntax and Data Structures ##

glengths <- c(4.6, 3000, 50000) ## a vector with numeric types

glengths

species <- c("ecoli", "human", "corn") ## a vector with character types

species

## all elements of a vector must be the same type, or RStudio will convert it to the same type

# species <- c("ecoli", "human", corn) ## in this case we get an error because there are no quotations around corn


############

## Exercise
# Try to create a vector of numeric and character values by combining the two vectors that we just created (glengths and species). Assign this combined vector to a new variable called combined. Hint: you will need to use the combine c() function to do this. Print the combined vector in the console, what looks different compared to the original vectors?

combined <- c(glengths, species)

combined ## all elements are in quotations, meaning there was conversion of datatypes to character types

############


expression <- c("low", "high", "medium", "high", "low", "medium", "high")

expression <- factor(expression) ## this will assign an integer to a factor level. this is assigned alphabetically based on the first letter of each element in the vector. in this case, high=1, low=2, and medium=3


############

## Exercises

# Let’s say that in our experimental analyses, we are working with three different sets of cells: normal, cells knocked out for geneA (a very exciting gene), and cells overexpressing geneA. We have three replicates for each celltype.

# Create a vector named samplegroup with nine elements: 3 control (“CTL”) values, 3 knock-out (“KO”) values, and 3 over-expressing (“OE”) values.

samplegroup <- c("CTL", "KO", "OE", "OE", "CTL", "KO", "CTL", "OE", "KO")

#Turn samplegroup into a factor data structure.

samplegroup <- factor(samplegroup)

############


## matrices are made by stacking two or more vectors of the same length and datatype

## dataframes are similar to matrices in that the comprising vectors must be the same length, but they can have different datatypes.

df <- data.frame(species, glengths)

df


############

## Exercise

# Create a data frame called favorite_books with the following vectors as columns:

titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")

pages <- c(453, 432, 328)

############


df2 <- data.frame(titles, pages)

list1 <- list(species, df, number) ## we can organize various different data structures in a list

list1


############

# Exercise

## Create a list called list2 containing species, glengths, and number.

list2 <- list(species, glengths, number)

list2

########################################################################



## Module 1.3: Functions and Arguments ##

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


############

# Exercise

# Let’s use base R function to calculate mean value of the glengths vector. You might need to search online to find what function can perform this task.

mean(glengths)

# Create a new vector test <- c(1, NA, 2, 3, NA, 4). Use the same base R function from exercise 1 (with addition of proper argument), and calculate mean value of the test vector. The output should be 2.5.

test <- c(1, NA, 2, 3, NA, 4)

?mean

mean(test, na.rm=TRUE)

# NOTE: In R, missing values are represented by the symbol NA (not available). It’s a way to make sure that users know they have missing data, and make a conscious decision on how to deal with it. There are ways to ignore NA during statistical calculation, or to remove NA from the vector. If you want more information related to missing data or NA you can go to this page (please note that there are many advanced concepts on that page that have not been covered in class).

# Another commonly used base function is sort(). Use this function to sort the glengths vector in descending order.

?sort

sort(glengths, decreasing = TRUE)

############


square_it <- function(x) {
  square <- x * x
  return(square)
}

square_it(5)

## you do not need to include 'return()' at the end when defining a function but it is regarded as best practice


############

# Exercise

# Write a function called multiply_it, which takes two inputs: a numeric value x, and a numeric value y. The function will return the product of these two numeric values, which is x * y. For example, multiply_it(x=4, y=6) will return output 24.


multiply_it <- function(x, y) {
  product <- x * y
  return(product)
}

multiply_it(4, 6)

########################################################################



## Module 1.4: Reading in and inspecting data ##

?read.csv ## this brings up documentation for read.table because it is the parent function

metadata <- read.csv(file="./data/mouse_exp_design.csv")


############

# Exercise

# Download this tab-delimited .txt file and save it in your project’s data folder.
# Read it in to R using read.table() with the approriate arguments and store it as the variable proj_summary. To figure out the appropriate arguments to use with read.table(), keep the following in mind:
# - all the columns in the input text file have column name/headers
# - you want the first column of the text file to be used as row names (hint: look up the input for the row.names = argument in read.table())
# Display the contents of proj_summary in your console

?read.table

proj_summary <- read.table(file="~/Documents/GitHub/introR/data/project-summary.txt", header=TRUE) ## the header argument will set the first row as variable names when set to TRUE

############


head(metadata)



############

# Exercise

# Use the class() function on glengths and metadata, how does the output differ between the two?

class(glengths) 

class(metadata)

## class reports on the datatypes of the elements of glengths vector but on the entirety of metadata as a dataframe. Therefore the output for class(metadata) is data.frame

# Use the summary() function on the proj_summary dataframe, what is the median “rRNA_rate”?

summary(proj_summary) ## median for rRNA_rate is 0.005082

# How long is the samplegroup factor?


?length

length(samplegroup) # 9

# What are the dimensions of the proj_summary dataframe?

dim(proj_summary) ## 9 col by 9 rows

# When you use the rownames() function on metadata, what is the data structure of the output?

rownames(metadata) ## stacked vectors of character-type data

# [Optional] How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.

length(colnames(proj_summary)) # 9

####################################################################



## Module 2.1: Data Wrangling: Subsetting Vectors and Factors

age <- c(15, 22, 45, 52, 73, 81)

age[5] # fifth value from left to right

age[-5] # all values except fifth

age[c(3,5,6)] # nesting with c and a vector in the call function

# OR 

idx <- c(3,5,6) # create vector of the elements of interest
age[idx] # and then call it

age[1:4] # calling continuous values with vector


############

# Exercise

# Create a vector called alphabets with the following letters, C, D, X, L, F.

alphabets <- c("C", "D", "X", "L", "F")

alphabets

# Use the associated indices along with [ ] to do the following:
  # - only display C, D and F

alphabets[c(-3, -4)]

  # - display all except X

alphabets[-3]

  # - display the letters in the opposite order (F, L, X, D, C)

alphabets[5:1]

############


age

age > 50

age > 50 | age < 18

age

age[age > 50 | age < 18]  ## nested

# OR

## create a vector first then select
idx <- age > 50 | age < 18
age[idx]


which(age > 50 | age < 18) # will give you position of element that meet the criteria

age[which(age > 50 | age < 18)]  ## nested

# OR

## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == "high"] # nesting

idx <- expression == "high" # no nesting

expression[idx]


############

# Exercise

# Extract only those elements in samplegroup that are not KO (nesting the logical operation is optional).

samplegroup[samplegroup != "KO"]

############


expression

str(expression)

expression <- factor(expression, levels=c("low", "medium", "high")) # you can re-factor a factor 

str(expression)


############

# Exercise

# Use the samplegroup factor we created in a previous lesson, and relevel it such that KO is the first level followed by CTL and OE.

samplegroup

str(samplegroup)

samplegroup <- factor(samplegroup, levels = c("KO", "CTL", "OE"))

str(samplegroup)

#############




## Module 2.2: Packages and libraries ##

sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages

install.packages("ggplot2")

# install.packages("BiocManager")

# BiocManager::install("ggplot2") # installing packages through biocmanager

# install.packages("~/Downloads/ggplot2_1.0.1.tar.gz", type="source", repos=NULL) # installing packages by source

library(ggplot2)

search()


############

# Exercise

# The ggplot2 package is part of the tidyverse suite of integrated packages which was designed to work together to make common data science operations more user-friendly. We will be using the tidyverse suite in later lessons, and so let’s install it. 

install.packages("tidyverse")

############



## Module 2.3: Data wrangling: dataframes, matrices, and lists ##

metadata[1, 1] # Output "Wt"

metadata[1, 3] # Output "1"

metadata[3, ] # Extract third row

metadata[ , 3] # Extract third col

metadata[ , 3, drop = FALSE] # turning off drop allows us to extra it as a df

metadata[ , 1:2] 

metadata[c(1,3,6), ] 

metadata[c("sample1", "sample2", "sample3") , "celltype"] 

# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)

metadata$genotype # extracting the genotype column of metadata

metadata$genotype[1:5] # Extracting the first to fifth cell of genotype col


############

# Exercises

# Return a data frame with only the genotype and replicate column values for sample2 and sample8.

metadata[c("sample2", "sample8") , c("genotype", "replicate")] 

# Return the fourth and ninth values of the replicate column.

metadata$replicate[c(4,9)]

# Extract the replicate column as a data frame.

metadata[ , 3, drop = FALSE]

##############


metadata$celltype == "typeA" #select for a specific value within a col

logical_idx <- metadata$celltype == "typeA"

metadata[logical_idx, ] # extract rows that follow this rule

which(metadata$celltype == "typeA")

idx <- which(metadata$celltype == "typeA")

metadata[idx, ]

which(metadata$replicate > 1)

idx <- which(metadata$replicate > 1)

metadata[idx, ]

metadata[which(metadata$replicate > 1), ]

sub_meta <- metadata[which(metadata$replicate > 1), ]



############

# Exercise

# Subset the metadata dataframe to return only the rows of data with a genotype of KO.

metadata[which(metadata$genotype == "KO"), ]

############


list1[[2]]

comp2 <- list1[[2]]
class(comp2)

list1[[1]]

list1[[1]][1]


##############

# Exercises

# Create a list named random with the following components: metadata, age, list1, samplegroup, and number.

age <- list(age)

samplegroup <- list(samplegroup) ## let's ensure that age and samplegroup are lists for neatness and ease of extraction with our new list

random <- c(metadata, age, list1, samplegroup, number)

random

# Extract the samplegroup component.

random[[8]]

############



names(list1) 

names(list1) <- c("species", "df", "number")

names(list1)

list1$df



############

# Exercise

# Let’s practice combining ways to extract data from the data structures we have covered so far:
  
# Set names for the random list you created in the last exercise.

names(random)

# Extract the age component using the $ notation

names(random) <- c("genotype", "celltype" , "replicate" , "age", "species",  "df", "number",  "samplegroup" , "number" )

names(random)

random$age