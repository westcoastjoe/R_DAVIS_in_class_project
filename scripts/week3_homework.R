set.seed(15)
hw3 <- runif(50, 4, 50)
hw3 <- replace(hw3, c(4,12,22,27), NA)
hw3

#problem 1: prob1 = number of hw3 between 14 and 38 inclusive with NA removed
prob1 <- hw3[complete.cases(hw3 <= 38 & hw3 >= 14)]

length(prob1)

#problem 2: multiply all the prob1 times 3, then add ten to each of them
times3 <- prob1 * 3

plus10 <- times3 + 10


#problem 3: select every other number in the plus10 list
plus10[c(TRUE, FALSE)]

length[plus10(c(TRUE, FALSE))]

hw4 <- hw3[complete.cases(hw3)]

hw4[hw4 <= 38 & hw4 >= 14]

prob1 <- hw4[hw4 <= 38 & hw4 >= 14]

length(prob1)

times3 <- prob1 * 3

plus10 <- times3 + 10

plus10[c(TRUE, FALSE)]
