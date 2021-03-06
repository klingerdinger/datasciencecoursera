#Tidying the 'untidy' Samsung data

This package reformats the data provided in the directory "UntidyData", and is described fully in "UntidyData/README".

The reformatted data is generated by the "run_analysis.R" script, found in the top directory. The output is "tidyData.txt", which contains the mean value of the mean/standard deviation variables, for each unique participant/activity combination (where participants and activities are described in "UntidyData/README". The reformatted data is space delimited. The column headings (after "Participant" and "Activity") are described in "UntidyData/features_info.txt", except that "-" characters have been replaced by "." characters, and "()" strings have been replaced by "..." strings. The reformatted data is also described in "CodeBook.txt".

#Running the code

1) Clone this repository

2) run: Rscript run_analysis.R

3) look for the output: "tidyData.txt"