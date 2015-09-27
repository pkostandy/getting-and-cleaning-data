# Getting and cleaning data
#### Course Project

The purpose of this project is to create a tidy data set derived from activity data obtained from a group of 30 volunteers who were outfitted with a smartphone (Samsung Galaxy S2) on their waists and observed performing different activities.

The accelerometer and gyroscope on the phone were used to capture 3-axial linear acceleration as well as 3-axial angular velocity at 50 Hz. The data was preprocessed in the time and frequency domains, and ultimately used to produce a number of features tied to every subject and activity.

More information about the raw data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Ultimately, the `run_analysis.R` script will calculate the means of a number of variables (means and standard deviations amongst the different features) for every subject and activity and write them to `means.txt`.

This script requires the "UCI HAR Dataset" to be unzipped and in the same
folder as the script. The dataset can be obtained from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). I have decided not to attempt to download the necessary data using the script as the `download.file` parameters may vary from system to system.

To reproduce the tidy dataset in `means.txt`, you only need to run `run_analysis.R`. Below is an outline of how it processes the data.

1. First, it loads the `dplyr` package which is needed towards the end of the analysis. It is assumed that this package is already installed on the user's system. If not, it can be installed using the `install.package("dplyr")` command.
2. The training and test data are then separately imported into `trainingData` and `testData`. `trainingDataLabels` reads in the activity designation for each observation while `trainingSubject` reads in the subject number for which it was made. The correlates for the test variables are `testDataLabels` and `testSubject`.
3. Variable names are subsequently obtained from the `features.txt` file and assigned to the appropriate columns.
4. Columns representing subject number and activity id are added to each data set.
5. The training and data sets are merged into a larger data set called `mergedData`.
6. The columns with means or standard deviations are then selected from the dataset. I've opted to be conservative when excluding variables by including all variable where "mean" or "std" appeared regardless of case.
7. Activity designations are then read from the `activity_labels.txt` file into `activities`.
8. The column containing activity data is subsequently converted to a factor variable. The levels of this variable are then assigned to `activities`.
9. The data are subsequently grouped by subject and activity using `group_by()` (hence the `dplyr` dependency). `summarize_each()` is used to calculate the mean of every variable that remains based on this grouping. The result is assigned to `sumData`.
10. The variable names are cleaned up such that they are syntactically valid. I've elected not to expand most abbreviations (such as t to time, f to frequency, Acc to acceleration) to make the variable names "more descriptive". This would have made the variable names fairly long and cumbersome to work with. `.Avg` is appended to every variable name to signify that it's a calculated average.
11. Finally, the results of this analysis contained in `sumData` are written to `means.txt`.
