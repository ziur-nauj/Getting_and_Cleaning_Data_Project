#This R script called run_analysis.R does the following:
#
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Step 1: Merge train a test data in a single data frame

# Step 1.1: Generate data frame corresponding to test data

subject_test_data <- read.table("UCI HAR Dataset//test//subject_test.txt")
X_test_data <- read.table("UCI HAR Dataset//test//X_test.txt")
y_test_data <- read.table("UCI HAR Dataset//test//y_test.txt")
body_acc_x_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//body_acc_x_test.txt")
body_acc_y_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//body_acc_y_test.txt")
body_acc_z_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//body_acc_z_test.txt")
body_gyro_x_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//body_gyro_x_test.txt")
body_gyro_y_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//body_gyro_y_test.txt")
body_gyro_z_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//body_gyro_z_test.txt")
total_acc_x_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//total_acc_x_test.txt")
total_acc_y_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//total_acc_y_test.txt")
total_acc_z_test_data <- read.table("UCI HAR Dataset//test//Inertial Signals//total_acc_z_test.txt")


dframe_test <- data.frame(subject_test_data, y_test_data, X_test_data,body_acc_x_test_data,body_acc_y_test_data,body_acc_z_test_data,
                           body_gyro_x_test_data, body_gyro_y_test_data, body_gyro_z_test_data, total_acc_x_test_data, total_acc_y_test_data, total_acc_z_test_data)

# Step 1.2: Generate data frame corresponding to train data

subject_train_data <- read.table("UCI HAR Dataset//train//subject_train.txt")
X_train_data <- read.table("UCI HAR Dataset//train//X_train.txt")
y_train_data <- read.table("UCI HAR Dataset//train//y_train.txt")
body_acc_x_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//body_acc_x_train.txt")
body_acc_y_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//body_acc_y_train.txt")
body_acc_z_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//body_acc_z_train.txt")
body_gyro_x_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//body_gyro_x_train.txt")
body_gyro_y_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//body_gyro_y_train.txt")
body_gyro_z_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//body_gyro_z_train.txt")
total_acc_x_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//total_acc_x_train.txt")
total_acc_y_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//total_acc_y_train.txt")
total_acc_z_train_data <- read.table("UCI HAR Dataset//train//Inertial Signals//total_acc_z_train.txt")

dframe_train <- data.frame(subject_train_data, y_train_data, X_train_data,body_acc_x_train_data,body_acc_y_train_data,body_acc_z_train_data,
                           body_gyro_x_train_data, body_gyro_y_train_data, body_gyro_z_train_data, total_acc_x_train_data, total_acc_y_train_data, total_acc_z_train_data)


# Step 1.3: Merge data frames from Step 1.1 and 1.2 

dframe <- rbind(dframe_test,dframe_train)

# Step 2: Extract only data corresponding to means and standard deviations


# The mean and std location in the X_train_data is found in the following columns
mean_std_location <-c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,
  		      215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,
  		      504,516,517,529,530,542,543)

# To extract the requested data from the dframe using the indices above we need to offset them by 2

offset<-2

# Extract info from dframe

mean_std_data <- dframe[, offset + mean_std_location]


# Use descriptive names for activities

dframe[dframe[,2] == 1,2] = "WALKING"
dframe[dframe[,2] == 2,2] = "WALKING_UPSTAIRS"
dframe[dframe[,2] == 3,2] = "WALKING_DOWNSTAIRS"
dframe[dframe[,2] == 4,2] = "SITTING"
dframe[dframe[,2] == 5,2] = "STANDING"
dframe[dframe[,2] == 6,2] = "LAYING"

# Generate clean data frame with first two columns being the individual and activity respectively and
# rest of columns the mean and standard deviation obtained from previous steps.

cleandframe <- data.frame(dframe[,c(1,2)],mean_std_data)

# Finally, add names to columns

datanames <- c("Subject","Activity","tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z",
"tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y",
"tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X",
"tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z",
"tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y",
"tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z",
"tBodyAccMag-mean()", "tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()","tBodyAccJerkMag-mean()",
"tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()",
"fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z",
"fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y",
"fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y",
"fBodyGyro-std()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()",
"fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")

names(cleandframe) <- datanames

#Initialize tidydataframe
tidydataframe <- data.frame(matrix(ncol = length(datanames), nrow = 180))

#Add column names
names(tidydataframe) <- datanames

#Initialize counter
z<-1

#Loop through all possible "Subject"/"Activity" combinations to calculate the average for each activity
#The tidydataframe variable contains the main output of this script.

for (i in 1:30) {
  for (j in c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
	{
		vector <- c(i,j)
		
		for(k in 3:length(datanames)) {
		
			vector <- c(vector, mean(cleandframe[cleandframe[,1]==i & cleandframe[,2]==j, k]))
			
		}
		
		tidydataframe[z,] <- vector
		z <- z + 1
			
	}
	
}

