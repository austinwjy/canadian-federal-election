# 2019 Canadian Federal Election Prediction

<h2>Description</h2>
This project focuses on predicting the 2019 Canadian federal election results by the datasets acquired before the election results from Canadian Election Study (CES) and the General Social Survey (GSS), to predict the overall popular votes of the 2019 Canadian federal election, using a logistic regression model with post-stratification (MRP) which is a statistical method to predict population by sample data, and then compare the results of the prediction with the true results of 2019 election to find out the performance of the model and study the importance of difference in results.

<h2>Languages and Tools Used</h2>

- <b>R(Studio)</b>
- <b>Logistic Regression</b>
- <b>post-stratification</b>

<h2>Project Walk-through</h2>

- <b>Download raw GSS data [AAi6ZXtG.csv](https://github.com/austinwjy/canadian-federal-election/blob/main/AAi6ZXtG.csv)</b>
- <b>Use [gss_cleaning.r](https://github.com/austinwjy/canadian-federal-election/blob/main/gss_cleaning.R) to clean the raw dataset to [gss.csv](https://github.com/austinwjy/canadian-federal-election/blob/main/gss.csv)</b>
- <b>Run [cleaning.r](https://github.com/austinwjy/canadian-federal-election/blob/main/cleaning.R) to clean CES and GSS dataset to get [survey_data.csv](https://github.com/austinwjy/canadian-federal-election/blob/main/survey_data.csv) and [census_data.csv](https://github.com/austinwjy/canadian-federal-election/blob/main/census_data.csv)</b>
- <b>Knit [RMD](https://github.com/austinwjy/canadian-federal-election/blob/main/Predicting%20the%202019%20Canadian%20Federal%20Election%20by%20MRP.Rmd)</b>

<h2>Full Report</h2>

[Report](https://github.com/austinwjy/canadian-federal-election/blob/main/Predicting%20the%202019%20Canadian%20Federal%20Election%20by%20MRP.pdf)
