Codebook
========
This codebook describes the data contained in `means.txt`. The first two columns are as follows

`subject`: integer, ranging from 1-30, identifying the the volunteer to which the observation applies.  
`activity`: string, containing one of six possible activities.

Variables to follow are all means of different 'features' which were calculated from the raw signals obtained from the accelerometer and gyroscope. The values are all normalized and lie between -1 and 1. Some examples include:

`tBodyAccmeanXYZ.Avg`: numeric, mean of body accelerations in the X, Y, or Z axis in the time domain for a particular subject/activity combination.  
`tBodyAccJerkMagstd.Avg`: numeric, mean of standard deviations of the magnitudes of the body acceleration jerk in the time domain for a particular subject/activity combination.

These features are further explained below. In `means.text` the values for each feature represent the means for a particular subject/activity combination.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`).

A Fast Fourier Transform (FFT) was then applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

The set of variables that were estimated from these signals are:

`mean`: Mean value  
`std`: Standard deviation  
`angle`: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the `angle` variable:

```
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```

Ultimately, the means of these variables were calculated for every subject and activity. Thus, every variable name has been appended with `.Avg`.
