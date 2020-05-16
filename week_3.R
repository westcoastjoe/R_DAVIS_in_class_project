#welcome to week 3

#vectors!

x <- 5

weight_g <- c(50, 60, 65, 82)

animals <- c("mouse", "rat", "dog")

#class tells us the data type in a vector
class(weight_g)

class(animals)

#str for structure
str(weight_g)

str(animals)

#we can modify vectors with the c() function
c(weight_g, 90)

weight_g <- c(weight_g, 90)

weight_g <- c(30, weight_g)

weight_g

#integers are different from numerical values, they cannot have decimal points integers can be typed using 2L
2L

1:10

x <- 1:10
class(x)

#coercion challenge
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(tricky)
class(num_char)
class(num_logical)
class(num_char)

#challenge 2
combined_logical <- c(num_logical, char_logical)

class(combined_logical)

#conditioal subsetting

weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)]


weight_g > 50
weight_g[weight_g>50]

#multiple operations at once
weight_g[weight_g<30 | weight_g > 50]

weight_g[weight_g >=30 & weight_g == 21]

#wildcard searches
animals[animals == "cat" | animals == "rat"]

animals %in% c("mouse", "rat")

animals[animals %in% c("mouse", "rat")]

#challenge 3 why does it return true?:
"four" > "five"

#letters have numerical value alphabetically

#vector math

x <- 1:10

x + 5

x * 10

y <-  100:109

x + y

z <- 1:2

x + z

a <- x + z
a

x

z

length(x)
length(y)

#recycling with conditional subsetting
x[c(TRUE, FALSE)]

x[c(TRUE, FALSE, FALSE)]

#working with missing data

#in R missing data are represented as NAs

heights <- c(2, 4, 4, NA, 6)

mean (heights)

#na.rm = NA remome
mean(heights, na.rm = TRUE)

max(heights, na.rm = TRUE)

class(heights) #numeric, NA is not a character, R views it as a number, sort of

heights

#is.NA = is it a NA?

is.na(heights)

#! = is not
!is.na(heights)

heights[!is.na(heights)]

#complete.cases extracting all the elements that are complete cases (are not NAs)

heights[complete.cases(heights)]

#challenge 4, remove the NAs

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

median(heights)

median(heights, na.rm = TRUE)

heights[heights > 67]

heights[complete.cases(heights > 67)]

heights2 <- heights[complete.cases(heights)]
heights2

median(heights2)

#longer than 67 inches
length(heights2[heights2 > 67])

#factors are a bit funky

sex <- factor(c("male", "female", "female", "male"))
class(sex)
typeof(sex)

levels(sex)

nlevels(sex)

#specify the order of the levels

sex <- factor(sex, levels = c("male", "female"))

sex

#making factors into characters

sex_ch <- as.character(sex)

