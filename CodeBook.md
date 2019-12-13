### Code Book

This course project required one to download the dataset "UCI HAR Dataset" 
then subset and transform the data to generate tidier data  

The project material subimitted include the following:
1) A link to script file "run_analyis.R" that performs the analysis 
2) A readme file that describe the script
3) the generated tidy data
4) this code book file which also describe the tidydata file and it variable


### TidyData set

TidyData aggregates both test and train data measurements and parameter
from the smartphone accelerometer data in "UCI HAR Dataset"

TidyData is a 180 by 563 table which averages the 561 measurements (columns:"V1-V561")
taken for each of the 30 study subjects (column:"subject_id") during the 6 measured
activities (column:"Activity_name"- walking, walking upstairs, walking downstairs,
sitting, standing, laying)

Original measuremnt where obtained from the following files in "UCI HAR Dataset"

- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train|test/subject_train.txt': Id the subject who performed the activity for each window sample. 