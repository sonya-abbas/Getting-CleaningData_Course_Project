## 1. Merges the training and the test sets to create one data set.
## the output of this step is three datasets which are: X_test_train dataset (allx),
## Y_test_train dataset (ally), subject_test_train dataset(allsub)

setwd("/Users/sonya/Documents/coursera/getting data and cleaning/course project/data/UCI HAR Dataset/test")
getwd()
dt = read.table("X_test.txt", sep="", header=FALSE)
dty = read.table("Y_test.txt", sep="", header=FALSE)
dtsub = read.table("subject_test.txt", sep="", header=FALSE)

setwd("/Users/sonya/Documents/coursera/getting data and cleaning/course project/data/UCI HAR Dataset/train")
dt2 = read.table("X_train.txt", sep="", header=FALSE)
dty2 = read.table("Y_train.txt",sep="", header=FALSE)
dtsub2 = read.table("subject_train.txt",sep="", header=FALSE)
allx= rbind(dt,dt2, header=TRUE)
nrow(allx)
ncol(allx)
ally= rbind(dty,dty2, header=TRUE)
nrow(ally)
ncol(ally)
allsub= rbind(dtsub,dtsub2, header=TRUE)
nrow(allsub)
ncol(allsub)
all=cbind(allx,ally, allsub)
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## this extraction include the columns that describe mean and stabdard deviation measurments..no include to frequency mean or std 
## since it's a totally different measurment 
all_subset=all[,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,562,563)]

## 3. Uses descriptive activity names to name the activities in the data set
all_subset[,c(41)]=sub("1", "WALKING", all_subset[,c(41)])
all_subset[,c(41)]=sub("2", "WALKING_UPSTAIRS", all_subset[,c(41)])
all_subset[,c(41)]=sub("3", "WALKING_DOWNSTAIRS", all_subset[,c(41)])
all_subset[,c(41)]=sub("4", "SITTING", all_subset[,c(41)])
all_subset[,c(41)]=sub("5", "STANDING", all_subset[,c(41)])
all_subset[,c(41)]=sub("6", "LAYING", all_subset[,c(41)])
## 4. Appropriately labels the data set with descriptive variable names. 
names(all_subset)=c("TriaxialBodyAccelerationMeanX","TriaxialBodyAccelerationMeanY","TriaxialBodyAccelerationMeanZ",
                    "TriaxialBodyAccelerationStdX","TriaxialBodyAccelerationStdY","TriaxialBodyAccelerationStdZ",
                    "TriaxialGravityAccelerationMeanX","TriaxialGravityAccelerationMeanY","TriaxialGravityAccelerationMeanZ", "TriaxialGravityAccelerationStdX",
                    "TriaxialGravityAccelerationStdY","TriaxialGravityAccelerationStdZ","TriaxialBodyAccelerationJerkMeanX","TriaxialBodyAccelerationJerkMeanY",
                    "TriaxialBodyAccelerationJerkMeanZ","TriaxialBodyAccelerationJerkStdX","TriaxialBodyAccelerationJerkStdY",
                    "TriaxialBodyAccelerationJerkStdZ","TriaxialBodyGyroscopeMeanX","TriaxialBodyGyroscopeMeanY","TriaxialBodyGyroscopeMeanZ","TriaxialBodyGyroscopeStdX",
                    "TriaxialBodyGyroscopeStdY","TriaxialBodyGyroscopeStdZ","TriaxialBodyGyroscopeJerkMeanX","TriaxialBodyGyroscopeJerkMeanY","TriaxialBodyGyroscopeJerkMeanZ",
                    "TriaxialBodyGyroscopeJerkStdX","TriaxialBodyGyroscopeJerkStdY","TriaxialBodyGyroscopeJerkStdZ","TriaxialBodyAccelerationMagnitudeMean",
                    "TriaxialBodyAccelerationMagnitudeStd","TriaxialGravityAccelerationMagnitudeMean","TriaxialGravityAccelerationMagnitudeStd","TriaxialBodyAccelerationJerkMagnitudeMean",
                    "TriaxialBodyAccelerationJerkMagnitudeStd","TriaxialBodyGyroscopeMagnitudeMean","TriaxialBodyGyroscopeMagnitudeStd", "TriaxialBodyGyroscopeJerkMagnitudeMean","TriaxialBodyGyroscopeJerkMagnitudeStd",
                    "Activity","Subject")
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tapply(all_subset,all_subset[,c(41)],mean)
??ddply
library("plyr")
res=ddply(all_subset,.(Activity,Subject),summarise, 
          TriaxialBodyAccelerationMeanX=mean(TriaxialBodyAccelerationMeanX), TriaxialBodyAccelerationMeanY=mean(TriaxialBodyAccelerationMeanY),
          TriaxialBodyAccelerationMeanZ=mean(TriaxialBodyAccelerationMeanZ),
          TriaxialBodyAccelerationStdX=mean(TriaxialBodyAccelerationStdX), TriaxialBodyAccelerationStdY=mean(TriaxialBodyAccelerationStdY),
          TriaxialBodyAccelerationStdZ=mean(TriaxialBodyAccelerationStdZ),
          TriaxialGravityAccelerationMeanX=mean(TriaxialGravityAccelerationMeanX), TriaxialGravityAccelerationMeanY=mean(TriaxialGravityAccelerationMeanY),
          TriaxialGravityAccelerationMeanZ=mean(TriaxialGravityAccelerationMeanZ),  TriaxialGravityAccelerationStdX=mean(TriaxialGravityAccelerationStdX),
          TriaxialGravityAccelerationStdY=mean(TriaxialGravityAccelerationStdY), TriaxialGravityAccelerationStdZ=mean(TriaxialGravityAccelerationStdZ),
          TriaxialBodyAccelerationJerkMeanX=mean(TriaxialBodyAccelerationJerkMeanX), TriaxialBodyAccelerationJerkMeanY=mean(TriaxialBodyAccelerationJerkMeanY),
          TriaxialBodyAccelerationJerkMeanZ=mean(TriaxialBodyAccelerationJerkMeanZ), TriaxialBodyAccelerationJerkStdX=mean(TriaxialBodyAccelerationJerkStdX),
          TriaxialBodyAccelerationJerkStdY=mean(TriaxialBodyAccelerationJerkStdY),  TriaxialBodyAccelerationJerkStdZ=mean(TriaxialBodyAccelerationJerkStdZ),
          TriaxialBodyGyroscopeMeanX=mean(TriaxialBodyGyroscopeMeanX), TriaxialBodyGyroscopeMeanY=mean(TriaxialBodyGyroscopeMeanY),
          TriaxialBodyGyroscopeMeanZ=mean(TriaxialBodyGyroscopeMeanZ), TriaxialBodyGyroscopeStdX=mean(TriaxialBodyGyroscopeStdX),
          TriaxialBodyGyroscopeStdY=mean(TriaxialBodyGyroscopeStdY), TriaxialBodyGyroscopeStdZ=mean(TriaxialBodyGyroscopeStdZ),
          TriaxialBodyGyroscopeJerkMeanX=mean(TriaxialBodyGyroscopeJerkMeanX), TriaxialBodyGyroscopeJerkMeanY=mean(TriaxialBodyGyroscopeJerkMeanY),
          TriaxialBodyGyroscopeJerkMeanZ=mean(TriaxialBodyGyroscopeJerkMeanZ),
          TriaxialBodyGyroscopeJerkStdX=mean(TriaxialBodyGyroscopeJerkStdX),
          TriaxialBodyGyroscopeJerkStdY=mean(TriaxialBodyGyroscopeJerkStdY),
          TriaxialBodyGyroscopeJerkStdZ=mean(TriaxialBodyGyroscopeJerkStdZ), TriaxialBodyAccelerationMagnitudeMean=mean(TriaxialBodyAccelerationMagnitudeMean),
          TriaxialBodyAccelerationMagnitudeStd=mean(TriaxialBodyAccelerationMagnitudeStd), TriaxialGravityAccelerationMagnitudeMean=mean(TriaxialGravityAccelerationMagnitudeMean),
          TriaxialGravityAccelerationMagnitudeStd=mean(TriaxialGravityAccelerationMagnitudeStd), TriaxialBodyAccelerationJerkMagnitudeMean=mean(TriaxialBodyAccelerationJerkMagnitudeMean),
          TriaxialBodyAccelerationJerkMagnitudeStd=mean(TriaxialBodyAccelerationJerkMagnitudeStd), TriaxialBodyGyroscopeMagnitudeMean=mean(TriaxialBodyGyroscopeMagnitudeMean),
          TriaxialBodyGyroscopeMagnitudeStd=mean(TriaxialBodyGyroscopeMagnitudeStd), 
          TriaxialBodyGyroscopeJerkMagnitudeMean=mean(TriaxialBodyGyroscopeJerkMagnitudeMean), TriaxialBodyGyroscopeJerkMagnitudeStd=mean(TriaxialBodyGyroscopeJerkMagnitudeStd))
nrow(res)
write.table(res,"course_project_output.txt", row.name=FALSE) 
