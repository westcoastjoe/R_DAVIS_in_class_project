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

test