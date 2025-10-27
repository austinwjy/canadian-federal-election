# 2019 Canadian Federal Election Prediction

<h2>Description</h2>
This project focuses on predicting the 2019 Canadian federal election results using pre-election datasets from the Canadian Election Study (CES) and the General Social Survey (GSS). A logistic regression model with post-stratification (MRP) was applied to estimate the overall popular vote. The predicted results were then compared with the actual 2019 election outcomes to evaluate the model’s performance and analyze the significance of discrepancies between the prediction and reality.

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

- [Canadian Federal Election](https://github.com/austinwjy/canadian-federal-election/blob/main/Predicting%20the%202019%20Canadian%20Federal%20Election%20by%20MRP.pdf)

<h2>Data Disclosure</h2>
This project uses publicly available data from CES and GSS.
