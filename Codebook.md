GettingAndCleaningData
======================

Repository for the final project of the Getting and Cleaning Data course from the Data Science Specialization.

# Data sources

- Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HA%20Dataset.zip
- Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Initial data as collected from source quoted above, came in two sets: one for the training group of individuals and one for the testers. Labels for activities were stored in separate files. Our task was to recast the data into a smaller subset relating only information of interest that in this case were the std and mean measurements from all the measurements performed. Our task was arriving at a clean, tidy data set, with proper labelling and average of each variable for each activity and each subject combination.

# Analysis steps and transformations

1. Import train data.
2. Import test data.
3. Merge train and test data.
4. Label the data set using the features.txt and  activity_names.txt files.
5. Extract columns with 'mean' or 'std' measurements in their names.
6. Melt data keeping Subject activity nd activityName as indices
7. Transform the data set to obtain one with the exact data we require.
8. Write data frame to file.