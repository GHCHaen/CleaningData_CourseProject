## This script contains the processes used to clean the UCI Human Activity 
## Recognition (HAR) data provided in the course project material.

## Processing Steps:
##  1. Merge training and test data sets to create one combined data set.
##  2. Extract only the measurements on the mean and standard deviation for each
##     measurement.
##  3. Use descriptive activity names to name the activities in the data set.
##  4. Label the data set with descriptive variable names.
##  5. Create an independent tidy data set with the average variable for each
##     activity and subject.

## The final generated output will be written to a file in the working directory
## with the following name. Update as necessary for your requirements.
output_file <- "CleaningData_CourseProject_TidyDataOutput.csv"

## Script Requirements
##  1. This script utilizes packages tidyr v1.1.2 and dplyr v1.0.4 which must
##  be loaded.
    library(tidyr)
    library(dplyr)
    if(packageVersion("tidyr") < "1.1.2" || packageVersion("dplyr") < "1.0.4")
    {
        warning("The installed version of the required packages are not up to
                 date. This script may not run properly without updating.")
    }
##  2. The raw data must be downloaded, saved, and unzipped to your working
##     directory. (The downloading and unizpping steps are commented here for
##     testing purposes. If you do not already have the data set, uncomment the
##     following code block prior to executing the script.)
##
##  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##  download.file(url, "./raw_data.zip")
##  if(!file.exists("./raw_data.zip"))
##  {
##      stop("The raw data file failed to download correctly. Please verify
##            the source location is correct.")  
##  }
##  else
##  {
##      unzip("./raw_data.zip")
##  }
##
##  3. The raw data set must be in the original directory structure as extracted
##     from the course project material within the current working directory.
##      - UCI HAR Dataset - Root directory
        data_root <- "./UCI HAR Dataset"
        data_test <- paste(data_root, "test", sep = "/")
        data_train <- paste(data_root, "train", sep = "/")
        if(!file.exists(data_root) ||
##          - Test Dataset
            !file.exists(data_test) ||
##          - Train Dataset
            !file.exists(data_train))
    {
        stop("Expected directory structure does not exist in the working
              directory.")    
    }
            
## Define files containing desired raw data
activities_file <- paste(data_root, "activity_labels.txt", sep = "/")
features_file <- paste(data_root, "features.txt", sep = "/")
test_subject_id_file <- paste(data_test, "subject_test.txt", sep = "/")
test_subject_activities_file <- paste(data_test, "y_test.txt", sep = "/")
test_subject_measurements_file <- paste(data_test, "x_test.txt", sep = "/")
train_subject_id_file <- paste(data_train, "subject_train.txt", sep = "/")
train_subject_activities_file <- paste(data_train, "y_train.txt", sep = "/")
train_subject_measurements_file <- paste(data_train, "x_train.txt", sep = "/")

## Verify raw data files exist
if(!file.exists(activities_file) || !file.exists(features_file) ||
   !file.exists(test_subject_id_file) ||
   !file.exists(test_subject_activities_file) ||
   !file.exists(test_subject_measurements_file) ||
   !file.exists(train_subject_id_file) ||
   !file.exists(train_subject_activities_file) ||
   !file.exists(train_subject_measurements_file))
{
    stop("Raw data files do not exist in the expected directory locations.")
}

## -- Begin Step 1 - Merge Training And Test Data Sets --

## Create combined data set combining all values from three files in test
## directory. (SubjectID, ActivityID, Measurements)
test_data <- mutate(read.table(test_subject_id_file, col.names = "SubjectID"),
                    read.table(test_subject_activities_file,
                               col.names = "ActivityID"),
                    read.table(test_subject_measurements_file))

## Create combined data set combining all values from three files in train
## directory. (SubjectID, ActivityID, Measurements)
train_data <- mutate(read.table(train_subject_id_file, col.names = "SubjectID"),
                     read.table(train_subject_activities_file,
                                col.names = "ActivityID"),
                     read.table(train_subject_measurements_file))

## Combine the data sets into one
combined_data <- bind_rows(test_data, train_data)

## -- End Step 1 - Training and Test Data Sets Merged --

## -- Begin Step 2 - Extract measurements on mean and standard deviation --

## Assign feature names to the measurements
features <- read.table(features_file, sep=" ", col.names = c("ID", "Value"))
names(combined_data) <- c("SubjectID", "ActivityID", features[,2])

## Extract measurements for mean and standard deviation
## (Mean interpreted to include mean values such as meanFreq, gravityMean, etc.)
combined_data <- select(combined_data, matches("(SubjectID|ActivityID|mean|std)",
                                                ignore.case = TRUE))

## -- End  Step 2 - Data Set now contains only Subject ID, Activity ID and    --
## --               measurements for mean (mean) and standard deviation (std) --

## -- Begin Step 3 - Use descriptive Activity names in the data set --

## Read activities description file
activities <- read.table(activities_file, sep=" ", col.names = c("ID", "Value"))

## Replace ActivityID with descriptive value from activities data and arrange
combined_data <-
    ## Join with Activities data to include descriptive value
    inner_join(combined_data, activities, 
                            by = c("ActivityID" = "ID")) %>% 
    ## Remove numeric Activity column
    select(-ActivityID) %>%
    ## Reorder and rename columns so Activity is now the descriptive value
    select(SubjectID, Activity = Value, everything()) %>%
    ## Arrange the data by Subject then Activity
    arrange(SubjectID, Activity)

## -- End Step 3 - ActivityID replaced by Activity with descriptive values --

## -- Begin Step 4 - Label the data set with descriptive variable names --

## Descriptive feature values already applied to columns names earlier to 
## replace default X1, X2, etc.
## Clean up column names further by removing non-alpha characters.
names(combined_data) <- gsub("[^A-Za-z]", "", names(combined_data))
## Replace leading 't' with 'Time' to clearly indicate time domain signal
## (reference features_info.txt paragraph 1)
names(combined_data) <- gsub("^t", "Time", names(combined_data))
## Replace leading 'f' with 'Frequency' to clearly indicate frequency domain
## signal (reference features_info.txt paragraph 3)
names(combined_data) <- gsub("^f", "Frequency", names(combined_data))
## Correct camel casing for some terms where it is missing
names(combined_data) <- gsub("mean", "Mean", names(combined_data))
names(combined_data) <- gsub("angle", "Angle", names(combined_data))
names(combined_data) <- gsub("std", "STD", names(combined_data))
names(combined_data) <- gsub("gravity", "Gravity", names(combined_data))

## -- End Step 4 - Variable names now descriptive and easier to read --

## -- Beginning Step 5 - Create independent tidy data set containing   --
## --    the average of each variable grouped by Subject and Activity. --

## Group the data by Subject and Activity
tidy_data <- combined_data %>% group_by(SubjectID, Activity) %>%
## Return the average of all columns by group
             summarize_all(mean)
## Prepend AvgOf to column names in order to clearly indicate the altered value.
names(tidy_data) <- c("SubjectID", "Activity", 
                      paste("AvgOf", names(tidy_data[-1:-2]), sep = ""))

## -- End Step 5 - Data reduced to a single observation for each combination --
## --   of Subject and Activity with the group average of each measurement.  --

## Write the generated tidy data to a file in the working directory.
write.csv(tidy_data, output_file, row.names = FALSE)




