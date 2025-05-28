# Layoffs SQL project 

Data Cleaning
The raw layoffs data required several cleaning steps before analysis. This was done using SQL and included:
Removing duplicate rows using ROW_NUMBER()
Trimming extra spaces from text fields like company and country
Standardizing entries (e.g., changing variations like Crypto/Web3 to just Crypto)
Converting date fields to proper DATE format
Handling missing and blank values in columns like industry
Deleting rows with no meaningful data
Dropping helper columns like row_num after cleaning
You can find the full cleaning script in the file:
data-cleaning.sql

Exploratory Data Analysis (EDA)
Once the data was cleaned and standardized, I explored key patterns and trends related to layoffs in the tech industry. The cleaned data enabled more reliable analysis, including:
Identifying companies with the highest total layoffs using aggregation and grouping
Analyzing layoffs over time, grouped by year and by month, to reveal peaks and trends
Exploring the impact by industry and country, showing which sectors and regions were most affected
Ranking companies per year using window functions (DENSE_RANK) to uncover the top companies impacted annually
Calculating rolling totals of layoffs over time to visualize the cumulative impact
Filtering extreme cases such as companies with 100% layoffs for deeper investigation
These queries helped uncover temporal trends, industry-level insights, and geographical distributions, offering a clear picture of how layoffs unfolded across the tech sector.


