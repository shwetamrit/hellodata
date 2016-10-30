A.  Initial setup:
       1.set the current working directory 
       2. download sourse data from link below and unzip it to working directory of R Studio
B.The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
   1.http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   2.https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip(data for project)
C.Create one R script called run_analysis.R that does the following.
  1.Merges the training and the test sets to create one data set.
     1.1 Reading files in this 4 steps to be done.
          1.1.1 Read trainings tables.
          1.1.2 Read testing tables.
          1.1.3 Read feature vector.
          1.1.4 Read activity labels.
     1.2 Assign each column names.
     1.3 Merge all data in one set.  
  
  2.Extracts only the measurements on the mean and standard deviation for each measurement.
    2.1 Read column names.
    2.2 Create vector to define ID, mean and standard deviation.
    2.3 Make nessesary subset from setAllInOne.
  
  3.Use descriptive activity names to name the activities in the data set
  4.Appropriately labels the data set with descriptive variable names.
  5.Creates a second independent tidy data set with the average of each variable for each activity and each subject.
     5.1 Make ia second tidy data set.
     5.2 Wrte a second tidy set into text file.
D.Variables use in this:
  1.x_train, y_train, x_test, y_test, subject_train and subject_test contain data from the downloaded files.
  2.x_data, y_data and subject_data used to merge the previous datasets for  further analysis.

   