# README

## The description of every step in the project

1- First things first! we should load the *dplyr* library

2- The next step is to upload data sets into R. I uploaded **X**, **y**, and **Subject** of both *training* and *testing* data sets along with the **activity_labels.** Saved them in the variables with similar names

3- The next step is to prepare data sets to be merged. First, I changed the column names for the **Subject** and **y** data sets in order to prevent them from being overwritten by other columns while merging. I also selected the first six columns of **X** data sets which indicate *means* and *standard deviations* of total body acceleration.

4- In order to merge the data sets, first, I created the **Train** and **Test** separately using *mutate* function. Then I merged them together using *merge* function. In the end, I renamed the column names again using *rename* function.

5- In order to specify every activity instead of numbers, I used a *for* loop and **activity_labels** data set.

6- In the end, I created a second independent data set using the functions *summarize* and *group_by.*
