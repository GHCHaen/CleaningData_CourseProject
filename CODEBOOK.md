---
title: "CodeBook"
author: "C. Haen"
date: "2/17/2021"
---

## Output

The output of the script is a tidy data set containing an average for every
veriable of interest for each subject and activity.

## Columns

The output contains 88 columns in total.

[1] "SubjectID"

(numeric)

Range 1:30

Indicates the ID of each subject measured.

[2] "Activity"

(character) 

Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Indicates the activity each subject was engaged in at time of measurement.

All following columns are numeric and represent the average value for the
respective observed value in the original data set, grouped by subject and
activity. The names have been cleaned up to be easier to read.

Example: AvgOfTimeBodyAccMeanX - Represents the average value for all
measurements of TimeBodyAccMeanX (original feature name: tBodyAcc-mean()-X) for
the Subject and Activity specified in columns 1 and 2 respectively.

For further deatils on the meaning of each feature measured, please reference
the features_info.txt file contained within the raw data set.

[3] "AvgOfTimeBodyAccMeanX"                    
[4] "AvgOfTimeBodyAccMeanY"                    
[5] "AvgOfTimeBodyAccMeanZ"                    
[6] "AvgOfTimeBodyAccSTDX"                     
[7] "AvgOfTimeBodyAccSTDY"                     
[8] "AvgOfTimeBodyAccSTDZ"                     
[9] "AvgOfTimeGravityAccMeanX"                 
[10] "AvgOfTimeGravityAccMeanY"                 
[11] "AvgOfTimeGravityAccMeanZ"                 
[12] "AvgOfTimeGravityAccSTDX"                  
[13] "AvgOfTimeGravityAccSTDY"                  
[14] "AvgOfTimeGravityAccSTDZ"                  
[15] "AvgOfTimeBodyAccJerkMeanX"                
[16] "AvgOfTimeBodyAccJerkMeanY"                
[17] "AvgOfTimeBodyAccJerkMeanZ"                
[18] "AvgOfTimeBodyAccJerkSTDX"                 
[19] "AvgOfTimeBodyAccJerkSTDY"                 
[20] "AvgOfTimeBodyAccJerkSTDZ"                 
[21] "AvgOfTimeBodyGyroMeanX"                   
[22] "AvgOfTimeBodyGyroMeanY"                   
[23] "AvgOfTimeBodyGyroMeanZ"                   
[24] "AvgOfTimeBodyGyroSTDX"                    
[25] "AvgOfTimeBodyGyroSTDY"                    
[26] "AvgOfTimeBodyGyroSTDZ"                    
[27] "AvgOfTimeBodyGyroJerkMeanX"               
[28] "AvgOfTimeBodyGyroJerkMeanY"               
[29] "AvgOfTimeBodyGyroJerkMeanZ"               
[30] "AvgOfTimeBodyGyroJerkSTDX"                
[31] "AvgOfTimeBodyGyroJerkSTDY"                
[32] "AvgOfTimeBodyGyroJerkSTDZ"                
[33] "AvgOfTimeBodyAccMagMean"                  
[34] "AvgOfTimeBodyAccMagSTD"                   
[35] "AvgOfTimeGravityAccMagMean"               
[36] "AvgOfTimeGravityAccMagSTD"                
[37] "AvgOfTimeBodyAccJerkMagMean"              
[38] "AvgOfTimeBodyAccJerkMagSTD"               
[39] "AvgOfTimeBodyGyroMagMean"                 
[40] "AvgOfTimeBodyGyroMagSTD"                  
[41] "AvgOfTimeBodyGyroJerkMagMean"             
[42] "AvgOfTimeBodyGyroJerkMagSTD"              
[43] "AvgOfFrequencyBodyAccMeanX"               
[44] "AvgOfFrequencyBodyAccMeanY"               
[45] "AvgOfFrequencyBodyAccMeanZ"               
[46] "AvgOfFrequencyBodyAccSTDX"                
[47] "AvgOfFrequencyBodyAccSTDY"                
[48] "AvgOfFrequencyBodyAccSTDZ"                
[49] "AvgOfFrequencyBodyAccMeanFreqX"           
[50] "AvgOfFrequencyBodyAccMeanFreqY"           
[51] "AvgOfFrequencyBodyAccMeanFreqZ"           
[52] "AvgOfFrequencyBodyAccJerkMeanX"           
[53] "AvgOfFrequencyBodyAccJerkMeanY"           
[54] "AvgOfFrequencyBodyAccJerkMeanZ"           
[55] "AvgOfFrequencyBodyAccJerkSTDX"            
[56] "AvgOfFrequencyBodyAccJerkSTDY"            
[57] "AvgOfFrequencyBodyAccJerkSTDZ"            
[58] "AvgOfFrequencyBodyAccJerkMeanFreqX"       
[59] "AvgOfFrequencyBodyAccJerkMeanFreqY"       
[60] "AvgOfFrequencyBodyAccJerkMeanFreqZ"       
[61] "AvgOfFrequencyBodyGyroMeanX"              
[62] "AvgOfFrequencyBodyGyroMeanY"              
[63] "AvgOfFrequencyBodyGyroMeanZ"              
[64] "AvgOfFrequencyBodyGyroSTDX"               
[65] "AvgOfFrequencyBodyGyroSTDY"               
[66] "AvgOfFrequencyBodyGyroSTDZ"               
[67] "AvgOfFrequencyBodyGyroMeanFreqX"          
[68] "AvgOfFrequencyBodyGyroMeanFreqY"          
[69] "AvgOfFrequencyBodyGyroMeanFreqZ"          
[70] "AvgOfFrequencyBodyAccMagMean"             
[71] "AvgOfFrequencyBodyAccMagSTD"              
[72] "AvgOfFrequencyBodyAccMagMeanFreq"         
[73] "AvgOfFrequencyBodyBodyAccJerkMagMean"     
[74] "AvgOfFrequencyBodyBodyAccJerkMagSTD"      
[75] "AvgOfFrequencyBodyBodyAccJerkMagMeanFreq" 
[76] "AvgOfFrequencyBodyBodyGyroMagMean"        
[77] "AvgOfFrequencyBodyBodyGyroMagSTD"         
[78] "AvgOfFrequencyBodyBodyGyroMagMeanFreq"    
[79] "AvgOfFrequencyBodyBodyGyroJerkMagMean"    
[80] "AvgOfFrequencyBodyBodyGyroJerkMagSTD"     
[81] "AvgOfFrequencyBodyBodyGyroJerkMagMeanFreq"
[82] "AvgOfAngletBodyAccMeanGravity"            
[83] "AvgOfAngletBodyAccJerkMeanGravityMean"    
[84] "AvgOfAngletBodyGyroMeanGravityMean"       
[85] "AvgOfAngletBodyGyroJerkMeanGravityMean"   
[86] "AvgOfAngleXGravityMean"                   
[87] "AvgOfAngleYGravityMean"                   
[88] "AvgOfAngleZGravityMean"  
