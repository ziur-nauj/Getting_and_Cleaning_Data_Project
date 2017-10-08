# GENERAL DESCRIPTION:

This CodeBook aims at describing the main variables appearing in the
script "run_analysis.R" and the actions taken at the different
steps.

# MAIN VARIABLES:

dframe_test: Data frame that contains all test data
dframe_train: Data frame that contains all train data
dframe: Data frame that merges the test and train data
mean_std_data: Data frame that only contains columns from dframe which feature names end with "-mean()" or "-std()"
cleandframe: Data frame that contains "Subject","Activity" and data from mean_std_data with
tidydataframe: Data frame that contains the average of each feature for each "Subject" and "Activity" in cleandframe

# DATA MANIPULATION:

1- Merges the training and the test sets to create one data set.

The script starts by reading the data from the different files under the "test" folder
and under the "train" folder into individual data frames. Then it generates 
a data frame for the test data and a data frame for the train data by merging all columns.
This can be easily achieve by using data.frame("list of data frames").
Finally, to merge the data frame of the test data and train data, the scripts uses
rbind.

2- Extracts only the measurements on the mean and standard deviation for each measurement.

The script assumes that the mean and standard deviation for each measurement are found
in the feature list of the data frames where the names end with "-mean()" and "-std()".
Note that the script does not look for these strings automatically, however it could
be implemented if the number is large.

This is stored in the data frame "mean_std_data".

3- Uses descriptive activity names to name the activities in the data set

This part of the script replaces the activity numbers with the corresponding
names. 1-"WALKING",2-"WALKING_UPSTAIRS", 3-"WALKING_DOWNSTAIRS", 4-"SITTING", 5-"STANDING",
6-"LAYING"


4- Appropriately labels the data set with descriptive variable names.

This scripts assumes the labels are added to the data set obtained in (2).
In order to make the data frame more clear, two columns are added at the beginning
describing the person and activity types for which the measurments are taken.

This is stored in the data frame "cleandframe"


5- From the data set in step 4, creates a second, independent tidy data set with the average of 
   each variable for each activity and each subject.

This part of the script uses the "cleandframe" from step (4) to obtain the averages of each
variable by looping through the different "Subject" and "Activity" columns. 
The final tidy data set is stored in tidydataframe.
