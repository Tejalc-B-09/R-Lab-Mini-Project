# R-Lab-Mini-Project
R lab Mini Project EDA, Visualization &amp; Prediction on Diabetes Dataset
Project Description :
The system will allow us to predict if the patient has diabetes on the basis of certain diagnostic measures available in the dataset. The different steps involved in EDA include: 1.Data Collection, 2.Data Cleaning and 3.Data Visualization. This project first conducts Exploratory Data Analysis (EDA) and data visualization on the diabetes dataset and then predict the diabetes. 


# Exploratory Data Analysis (EDA)

1. Descriptive statistics

Attribute type, Class distribution, Mean, Standard Deviation, Median, Quartile, Skewness, Correlation

2. Data visualization

Histogram plot

Density plot

Box and Whisker plot

Bar plot

Missing data map

Pair-wise correlation plot

# Prediction on Diabetes

We compare the performance for the following classifiers: 

1. Logistic Regression

2. Support Vector Machine (SVM)

3. random Forest

For EDA and Visualization Steps performed: 
1. Load libraries
2. Load the data
3. Clean the data
4. Delete columns 15 and 16 due to many missing values and column 1 (id), column 7 (location)          because they contain no useful information
5. Remove the row with missing values
6. Encode the class label (column 5): Glycosolated hemoglobin  > 7.0 is taken as a positive            diagnosis of diabetes
7. Encode the categorical data (column-7 gender)
8. Encode the categorical data (column-10 frame)
9. Descriptive statistics
10. Display the first 20 rows
11. Display the dimensions of the dataset
12. List types for each attribute
13. Distribution of the class labels
14. Summarize the dataset
15. Standard Deviations for the non-categorical columns
16. Perrom other operations like: Skewness, Correlation, and Visualization Plots

Predcition and Classification Steps performed:
1. Load libraries
2. Load the data
3. Clean the data
4. Delete columns 15 and 16 due to many missing values and column 1 (id), column 7 (location)          because they contain no useful information
5. Remove the row with missing values
6. Encode the class label (column 5): Glycosolated hemoglobin  > 7.0 is taken as a positive            diagnosis of diabetes
7. Encode the categorical data (column-7 gender)
8. Encode the categorical data (column-10 frame)
9. Split the data into training and validation sets
10. Comparison among different classifiers
    1. Logistic Regression
    2. Support Vector Machine
    3. random forest
    4. Parameter tunning via grid search for random forest
11. Make predictions on the validation set
12. Confusion matrix
13. Save the final classifier model into disk
14. Load the model from the disk
15. Make predictions using the loaded model
15. Make predictions using the loaded model
