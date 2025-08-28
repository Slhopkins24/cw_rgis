if(!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)

filter(iris_sub, Species == "virginica")
filter(iris_sub, Species %in% c("virginica", "versicolor"))
filter(iris_sub, Species != "virginica")
filter(iris_sub, !(Species %in% c("virginica", "versicolor")))
filter(iris_sub, Sepal.Length > 5)
filter(iris_sub, Sepal.Length >= 5)
filter(iris_sub, Sepal.Length < 5)
filter(iris_sub, Sepal.Length <= 5)
# Sepal.Length is less than 5 AND Species equals "setosa"
filter(iris_sub,
       Sepal.Length < 5 & Species == "setosa")
# same; "," works like "&"
filter(iris_sub,
       Sepal.Length < 5, Species == "setosa")
# Either Sepal.Length is less than 5 OR Species equals "setosa"
filter(iris_sub,
       Sepal.Length < 5 | Species == "setosa")
arrange(iris_sub, Sepal.Length)
arrange(iris_sub, desc(Sepal.Length))
select(iris_sub, Sepal.Length)
select(iris_sub, c(Sepal.Length, Sepal.Width))
select(iris_sub, -Sepal.Length)
select(iris_sub, -c(Sepal.Length, Sepal.Width))
# select columns starting with "Sepal"
select(iris_sub, starts_with("Sepal"))
# remove columns starting with "Sepal"
select(iris_sub, -starts_with("Sepal"))
# select columns ending with "Sepal"
select(iris_sub, ends_with("Width"))
# remove columns ending with "Sepal"
select(iris_sub, -ends_with("Width"))
# nrow() returns the number of rows of the dataframe
(x_max <- nrow(iris_sub))
# create a vector from 1 to x_max
x <- 1:x_max

# create a vector from 1 to x_max
x <- 1:x_max

# add as a new column
# named `x` as `row_id` when added
mutate(iris_sub, row_id = x)
# twice `Sepal.Length` and add as a new column
mutate(iris_sub, sl_two_times = 2 * Sepal.Length)


## piping 
iris_setosa <- filter(iris_sub, Species == "setosa")
iris_setosa <- filter(iris_sub, Species == "setosa")

iris_sub %>% 
  filter(Species=="setosa")


# exercise ----------------------------------------------------------------

#exercise filter iris_sub to contain only virginica

filter(iris_sub, Species == "virginica")
filter(iris_sub, Species == "virginica")


# exercise 2 --------------------------------------------------------------

# select column "sepal.width" in 'iris_sub' VERY CAPS SENSATIVE

select(iris_sub, Sepal.Width)


# exercise 3 --------------------------------------------------------------

#filter 'iris_sub' to contain only virginica, 
#then, pipe to select "Sepal.Width"
#then, ip to create a new column "sw3" that is a triple of the values in Sepal.Width
#assign to "df0"

## group operation 

#calculate mean

m <- mean(c(2,5,8))
s <- sum(c(2,5,8))

m_large <- mean(1:1000)

mean(iris_sub$Sepal.Length)

iris_sub %>%  
  group_by(Species) %>% 
  summarize(mean_sl = mean(Sepal.Length), sum_sl = sum(Sepal.Length), 
          mean_pl = mean(Petal.Length))




# join --------------------------------------------------------------------


df1 <- tibble(Species = c("A","B","C"), 
              x=c(1,2,3))
df2 <- tibble(Species = c("A","B","C"),
              y=c(10,12,13))

left_join(x= df1, y=df2, by = "Species")

df2_minus_c <- tibble(Species = c("A","B"),
              y=c(10,12))


left_join(x= df1, y=df2, by = "Species")



