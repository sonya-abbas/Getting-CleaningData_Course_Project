Getting-CleaningData_Course_Project
===================================
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 2.0
==================================================================
Abbas Sonya
==================================================================

General Idea:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

What we already have:
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

What we do:
There is few steps we follow in order to obtain tidy data from the raw data we have: 1) merge the test and train data together, 2) extract the required variables (mean and standard deviation): we follow a strategy in order to choose the related variables, this strategy based on our understanding of feautures and their measuremnets (for example, some features related to frequency mean which is a totaly different measure so we didn't include, same for angle features). 3) Our data contains activities and subjets as well, so in order to make the data more readible, we replace the numeral values of activities by their names (1-WALKING, 2-WALKING UPSTAIRS, 3-WALKING DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING). 4) The data has proper variables names that reflect the meaning of each column. 5) according to the requirement, we group the data by the activities and subjects variables and we apply the mean over each variable. 


For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- A 40-feature vector of mean and standard deviation measures. 
- The activity name. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'course_project_output.txt': tidy data, ready for analysis

The following files are available in the repo. Their descriptions are equivalent. 

- 'course_project_output.txt': Each row identifies the mean of 40 variables grouped by the activity and the subject. 


Notes: 
======
- 
- 


License:
========

