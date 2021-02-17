---
title: "ReadMe"
author: "C. Haen"
date: "2/17/2021"
---

## Purpose

This is the course project for week 4 of the Getting and Cleaning Data course.

## Raw Data

The source for the raw data used in this project is the UCI Machine Learning
Repository. The data set used is Human Activity Recognition Using Smartphones
Data Set. The website can be found here: [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Processing

The data has been processed using the run_analysis.R script. The basic tasks
executed by the script are as follows:

    1. Merges the training and the test sets to create one data set.
    
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    
    3. Uses descriptive activity names to name the activities in the data set
    
    4. Appropriately labels the data set with descriptive variable names. 
    
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
More complete details can be found in the comments within the script itself.

## Output

The output of the script is a tidy data set containing an average for every
veriable of interest for each subject and activity. A complete description of
the output file can be found in the CodeBook.md file.
