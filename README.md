### Run_analysis.R - Description

The script consist of a single function "run_analysis()" divided 
in diffrent sections (see comments in script) that perform each 
of the following functions sequentially:

Section 1 - Uses dir.create() and dowload.file() to download original data set to a created work directory
            and then function "unzip" to extract the data set
            
Section 2 - Uses dplyr's mutate() to concatenante the dataset of interest in both test and training data sets
            the the rbind() function to merge the two sets to create one data set.
            
Section 3 - Subset dataset to extract only the measurements on the mean and standard deviation for each measurement.

Section 4 - Use descriptive activity names to name the activities in the data set

Section 5 - Appropriately label the data set with descriptive variable names.

Section 6 - Use the melt() and dcast() function to create a second, independent tidy data set (tidyData) with the average of each                  variable for each activity and each subject, then writing this average to a .csv file.

### To run the script, simply source the script then call the function by typing run_analysis().No argument needs to be passed