run_analysis <- function() {
  # The required packages are loaded
  require(reshape2)
  
  # The training data is loaded
  subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
  x_train = read.table("UCI HAR Dataset/train/X_train.txt")
  y_train = read.table("UCI HAR Dataset/train/y_train.txt")
    
  # The test data is loaded
  subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
  x_test = read.table("UCI HAR Dataset/test/X_test.txt")
  y_test = read.table("UCI HAR Dataset/test/y_test.txt")  
  
  # The training and test data are merged together
  train_data = cbind(subject_train, y_train, x_train)
  test_data = cbind(subject_test, y_test, x_test )
  complete_data = rbind(test_data, train_data)
  
  # The features file is loaded and used to construct the names of the columns 
  features = read.table("UCI HAR Dataset/features.txt")
  columntitles = c("Subject", "Activity", as.character(features[,2]))
  colnames(complete_data) = columntitles
  
  # The indexes of all the features with 'std' and 'mean' are extracted
  stdMeasurementIndex = grep(("-std\\(\\)"), features[, 2]) +2
  meanMeasurementIndex = grep(("-mean\\(\\)"), features[, 2]) +2
  
  # The actual data from the selected columns is retrieved
  stdDevData = complete_data[,stdMeasurementIndex]
  meanData = complete_data[,meanMeasurementIndex]
  
  # The activity levels is extracted from file
  activity_names = read.table("UCI HAR Dataset/activity_labels.txt")
  
  # A new data frame with activity name for each row is created
  activity_name_col = data.frame(factor(complete_data$Activity, levels=activity_names[,1], labels=activity_names[,2]))
  colnames(activity_name_col) = "ActivityName"
  
  # Merge std, mean and activity name data, producing a std and mean measurements only data set
  extracted_data = cbind(complete_data[,1:2], activity_name_col, meanData, stdDevData)
  
  # The data frame is restructured
  melted_data = melt(extracted_data,id = c("Subject", "Activity", "ActivityName"))  
  tidy_data = dcast(melted_data, formula = Subject + Activity + ActivityName ~ variable, mean)
  
  # The tidy data is written to a file
  write.table(tidy_data,"tidyData.txt", row.names = FALSE)}