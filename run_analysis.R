#Start somewhere known
setwd("D:/DataScience/R_working")

#download the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
              ,"UCI_HAR_Dataset.zip")

#extract the file
unzip("UCI_HAR_Dataset.zip")

#goto the extracted dataset
setwd("D:/DataScience/R_working/UCI HAR Dataset")

#look at the filenames
list.files(".")
list.files("./train") #list files in train
list.files("./test") #list the files in test

#read in top levelfiles
activity_labels<-read.table("activity_labels.txt",sep="")
        names(activity_labels)<-c("activity","activitydescription")
features<-read.table("features.txt",sep="")

#read in test/train files
xtrain<-read.table("train/X_train.txt",sep="")                  #data
ytrain<-read.table("train/y_train.txt",sep="")                  #activity
subject_train<-read.table("train/subject_train.txt",sep="")     #subject
xtest<-read.table("test/x_test.txt",sep="")                     #data
ytest<-read.table("test/y_test.txt",sep="")                     #activity
subject_test<-read.table("test/subject_test.txt",sep="")        #subject

#apply headers to data frames '
# ***** this accomplishes part 4 (way early) ******************
names(xtrain)<-features$V2
names(ytrain)<-"activity"
names(xtest)<-features$V2
names(ytest)<-"activity"
names(subject_test)<-"subject"
names(subject_train)<-"subject"

#merge training data; merge test data
training<-cbind(xtrain,ytrain,subject_train)
testing<-cbind(xtest, ytest, subject_test)

#merge training and testing data
#  ****************** part 1 ******************
all_UCIHAR<-rbind(training,testing)

library(dplyr)
library(tidyr)

#find the columns for std() and mean()  
#******************** part 2 **********************
colsIWant<-grep("mean()|std()|subject|activity", names(all_UCIHAR), value=TRUE)
thin_UCIHAR<-all_UCIHAR[,colsIWant]

#**************** part 3 **************
#descriptive activity names, join activity_labels to thinned UCIHAR data
thin_UCIHAR_nameActivity<-left_join(thin_UCIHAR,activity_labels,by="activity")
names(thin_UCIHAR_nameActivity)

## free up some memory
rm(testing,training,xtest,xtrain,ytest,ytrain,subject_test,subject_train)


#******************** part 5 *******************
by_activity_subject<-thin_UCIHAR_nameActivity %>%
        group_by(subject,activitydescription)

means_by_activity_subject<-summarize_all(by_activity_subject,mean)

write.table(means_by_activity_subject,"Getting_and_Cleaning_assignment_part5.txt",row.names = FALSE)

