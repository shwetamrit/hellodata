#Download sourse data from link below and unzip it to working directory


if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#2.Merge the  training and the test sets to create one data set.

#2.1.1. Read trainings tables
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#2.1.2. Read testing tables.
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#2.1.3. Read feature vector.
features <- read.table('./data/UCI HAR Dataset/features.txt')
#2.1.4.Read activity labels
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
#2.2 Assign each column names.
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(activityLabels) <- c('activityId','activityType')
#2.3.Merge all data in one set   
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
set_All_One <- rbind(mrg_train, mrg_test)
#3.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.1.Read column names
colNames <- colnames(set_All_One)
#3.2.Create vector to define ID, mean and standard deviation.
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
#3.2.Make nessesary subset from setAllInOne.
set_Mean_Std <- set_All_One[ , mean_and_std == TRUE]
#4.Use descriptive activity names to name the activities in the data set
set_Activity_Names <- merge(set_Mean_Std, activityLabels,
                            by='activityId',
                            all.x=TRUE)
#5.Creates a second independent tidy data set with the average of each variable for each activity and each subject.
#5.1.Make a second tidy data set.
sec_Tidy_Set <- aggregate(. ~subjectId + activityId, set_Activity_Names, mean)
sec_Tidy_Set <- sec_Tidy_Set[order(sec_Tidy_Set$subjectId, sec_Tidy_Set$activityId),]
#5.2.Wrte a second tidy set into text file.
write.table(sec_Tidy_Set, "sec_Tidy_Set.txt", row.name=FALSE)    



