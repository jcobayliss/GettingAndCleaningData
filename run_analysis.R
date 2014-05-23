run_analysis <- function() {
  # Loading the information about labels, headers and features.
  # -----------------------------------
  labels <- read.table("UCI HAR Dataset/activity_labels.txt")    
  names(labels) <- c("ActivityID", "ActivityName")
  featureIndexes = c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503, 504, 513, 516, 517, 526, 529, 530, 529, 542, 543, 552)
  
  # Loading the data from the train set.
  # -----------------------------------
  xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")[, featureIndexes]  
  sTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
  names(sTrain) <- c("SubjectID")
  yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")  
  names(yTrain) <- c("ActivityID")
  # The columns are put together.
  train <- cbind(sTrain, xTrain, yTrain)
  # Creating the labeled activities.
  train <- merge(train, labels, by.x = "ActivityID", by.y = "ActivityID")
  
  # Loading the data from the test set.
  # -----------------------------------
  xTest <- read.table("UCI HAR Dataset/test/X_test.txt")[, featureIndexes]
  sTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  names(sTest) <- c("SubjectID")
  yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
  names(yTest) <- c("ActivityID")
  # The columns are put together.
  test <- cbind(sTest, xTest, yTest)
  # Creating the labeled activities.
  test <- merge(test, labels, by.x = "ActivityID", by.y = "ActivityID")
  
  # Both sets are put together to create a unique data set.
  data <- rbind(train, test)
  
  #x = ddply(data, .(SubjectID, ActivityName), summarize, meanV1 = mean(V1), stdV1 = sd(V1))
  
  # The data set is returned.
  return(data)  
}