# Getting_and_Cleaning_Data_Project
Scripts and files for the Getting_and_Cleaning_Data course project

# GENERAL DESCRIPTION:

The main purpose of this script is to obtain and clean data.

The data used for this assignment comes from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In particular, this R script called run_analysis.R does the following:

1- Merges the training and the test sets to create one data set.
2- Extracts only the measurements on the mean and standard deviation for each measurement.
3- Uses descriptive activity names to name the activities in the data set
4- Appropriately labels the data set with descriptive variable names.
5- From the data set in step 4, creates a second, independent tidy data set with the average of 
   each variable for each activity and each subject.


# IMPLEMENTATION:

The script assumes run_analysis.R is located in the working directory and the data is
uncompressed in this directory (with the default root folder: UCI HAR Dataset).

Please see CodeBook.md for an explanation of each part of the script.
