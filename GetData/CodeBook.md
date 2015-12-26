#Code book

## Overview

The space-delimited data file "tidyData.txt" produced by the R-script "run_analysis.R" provides the mean values of accelerometer and gyroscope data acquired from a Samsung smartphone. A group of 30 volunteers are considered, who are each assigned a unique "Participant" ID. The measurements are taken whilst the volunteers are performing various activities. A description of the code and of the various data columns of the output file are provided here. 

## Code description

The code is broadly split into two sections: the 'GetData' function, and the 'MAIN' routine. The GetData function acquires and merges the various raw data from the directory "UntidyData", from either the training or test data sets (described in "UntidyData/README"). The activity labels (described below) are applied to the data, and the mean and standard deviation data are extracted from the raw data.

In the 'MAIN' routine (labelled 'MAIN' in the code), the GetData function is called once for each of the two raw data sets. The two tidy data sets are then merged using rbind. In the following lines, the data is reshaped in order to allow for the data to be summarised in terms of the mean value of the raw mean and standard deviation data. The data is then written to disk as "tidy_data.txt".

## Output data description

The first two column headers are titled "Participant" and "Activity":
* Participant: A unique integer ID number, assigned to the volunteer
* Activity:    A character string indicating one of six activities from {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}

The remaining columns provide mean values of the mean and standard deviation data obtained in the experiment, in units of 'g' (standard gravity units). A description of the data headings is provided in "UntidyData/features_info.txt". Note that in the data tidying process, these column names have been modified slightly, such that:
* "-" characters have been replaced by "." characters
* "()" strings have been replaced by "..." strings
For each of the measurements provided in these remaining columns the type of data can be inferred from by whether they contain the following substrings:
* total_acc: The acceleration signal from the smartphone accelerometer X axis
* body_acc:  The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* body_gyro: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second
