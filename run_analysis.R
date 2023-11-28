###Loading "dplyr" Library

library(dplyr)

###Uploding datasets

x_train <- read.table(file = "./X_train.txt")
x_test <- read.table(file = "./X_test.txt")
subject_train <- read.table(file = "./subject_train.txt")
subject_test <- read.table(file = "./subject_test.txt")
y_train <- read.table(file = "./y_train.txt")
y_test <- read.table(file = "./y_test.txt")
activities <- read.table(file = "./activity_labels.txt")

###Preparing datasets to be merged

names(subject_train) <- "Volunteer ID"
names(subject_test) <- "Volunteer ID"
x_train <- x_train[ , 1:6]
x_test <- x_test[ , 1:6]
names(y_train) <- "Activity"
names(y_test) <- "Activity"

###Merging Datasets

train_dataset <- mutate(.data = subject_train , x_train , y_train )
test_dataset <- mutate(.data = subject_test , x_test , y_test )
dataset <- merge(x = train_dataset, y = test_dataset , all = TRUE)
dataset <- rename(.data = dataset , tBodyAcc_mean_X = V1 , tBodyAcc_mean_Y =V2 , tBodyAcc_mean_Z =V3 , tBodyAcc_std_X =V4 , tBodyAcc_std_Y =V5 , tBodyAcc_std_Z =V6  )

###Using descriptive activity names to name the activities in the data set

for (i in 1:6) {
  dataset$Activity <- gsub(pattern = i , replacement = activities[i , 2],x = dataset$Activity)
}

###Creating a second, independent data set with the average of each variable for each activity and each subject

second_dataset <- summarize(group_by(.data = dataset ,`Volunteer ID`, Activity)
          , Average_acc_mean_X = mean(tBodyAcc_mean_X)
          , Average_acc_mean_Y = mean(tBodyAcc_mean_Y)
          , Average_acc_mean_Z = mean(tBodyAcc_mean_Z)
          , Average_acc_std_X = mean(tBodyAcc_std_X)
          , Average_acc_std_Y = mean(tBodyAcc_std_Y)
          , Average_acc_std_Z = mean(tBodyAcc_std_Z)
          )
write.table(x = second_dataset, file = "./Tidy dataset.txt" , row.names = FALSE)

