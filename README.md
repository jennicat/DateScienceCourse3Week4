# DateScienceCourse3Week4
Repo for Class Assignment for Getting and Cleaning Data Week 4

Data was originally obtained from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This site describes the original dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The Script run_analysis.R does the following work:
1. Sets the working directory to somewhere known (D:/DataScience/R_working for me).
2. Downloads the file \*.zip above and extracts it into its directory structure.
3. Reads in the activity_labels.txt and features.txt files; reads in the training and test files for x_\*.txt, y_\*.txt, and subject_\*.txt.
  * where X_ is the data, Y_ is the activity (Walking, Walking up stairs, Walkding Down stairs etc) (see codebook.md for options) and subject_ is the subject id associated with each observation.
4. Applies headers (to the data (x_ files)) via features.txt, and self-assigned headers to subjects and activities
5. Combines X, Y, and subject data into a single table for each type of data Test or Train
6. Combines test and train tables into a single table
7. Extracts columns for activity, subject, *mean* and *standard deviation* into a smaller dataset 
8. Merges the activity description information from activity_labels.txt via left join to the table from 7.
9. Groups the new smaller data set by subject and activitydescription
10. Creates an even smaller dataset that only provides the average (by subject by activity) for each variable (means and stdev)
11. Writes that small dataset to a file called "Getting_and_Cleaning_assignment_part5.txt"
