# gg plot------------------------------------

pacman::p_load(tidyverse)
# call iris
#point figure creating a base line and 
g_point <- ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Sepal.Width))  + geom_point()

#with pipe
g_point <- iris %>% ggplot(aes(x = Sepal.Length,
                              y = Sepal.Width)) + geom_point()

#how to do color
g_point_col <- iris %>% ggplot(aes(x = Sepal.Length,
                    y = Sepal.Width, color = Species)) + geom_point()
##pitfall - common mistake!!!!
iris %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width), color = Species) +
  geom_point()
#how to change all one color
iris %>% ggplot(aes(x = Sepal.Length,
                    y = Sepal.Width,)) + geom_point(color = "salmon")
#line plot
df0 <- tibble(x = 1:50, y = 2*x)

## geom_line draws a line
## multiple lays can be added
df0 %>% ggplot(aes( x = x, y = y)) + 
  geom_line() + geom_point()

#histogram
iris %>%  ggplot(aes(x = Sepal.Length)) + geom_histogram()

#boxplot and filling in color
iris %>% ggplot(aes(x = Species, y = Sepal.Length, fill = Species)) + geom_boxplot()

#####GG PLOT EXERCISE------------------------------------------

#draw a scatter plot of petal.width(x) and petal.length (y)

g_petal <- iris %>% ggplot(aes( x = Petal.Width,
                                y = Petal.Length)) + geom_point()

# draw a boxplot between species 

g_petal_box <-iris %>% ggplot(aes( x = Species, 
                                   y = Petal.Length, fill = Species)) + geom_boxplot()

#add a new name layer of point , x = specie, y = petal. length
g_petal_box + 
  geom_point()

##how to change axis titles
g_petal_box + labs(x = "Plant species", y = "Petal length")

#### refreshers for exam
mtcars
 df_mtcars <- as_tibble(mtcars)
 
 #select rows with cyl is 4 
 filter(df_mtcars, cyl == 4)
 
 #selct columns mpg,cyl,disp,wt,vs,carb
 select(df_mtcars, c(mpg,cyl,disp,wt,vs,carb))
 
 #select rows with cyl is greater than 4 
 #then, select columns of mpg,cyl,disp,wt,vs,carb
 df_sub <- df_mtcars %>% 
   filter (cyl >4 ) %>% 
   select(mpg,cyl,disp,wt,vs,carb)
 
 ## type the following code and run 
 v_car <- rownames(mtcars)
 
 #add a new column called "car" to df_mtcars,
 #then reassign it to 'df_mtcars'
 
 df_mtcars <- mutate(df_mtcars, car = v_car)
 
 #identify the lightest (wt) car with cyl = 8 
df_mtcars %>% filter(cyl == 8) %>% arrange(wt)

##calculate the average weight (wt) of car withtin each group of gear number (gear)
#consider using group_by () and summarize ()
#assign to df_mean

df_mean <- df_mtcars %>%  group_by(gear) %>% summarize(average = mean(wt))

#combine of dplyr operations with ggplot 
df_mtcars %>% 
  ggplot(aes( x = wt, y = qsec)) +
  geom_point()
 
#
df_mtcars %>% filter(cyl == 6 ) %>%  ggplot(aes(x = wt, y = qsec))+ geom_point()


