# Layoffs SQL EDA Project

## Project Overview
This project presents an exploratory data analysis (EDA) on tech company layoffs using SQL (MySQL). The goal is to identify patterns and trends related to layoffs across different companies, industries, countries, and time periods.

## Objectives
- Identify companies with the highest number of layoffs
- Analyze layoffs by year and by month
- Find companies with 100% layoffs
- Calculate rolling totals to observe trends over time
- Rank top companies by layoffs per year using SQL window functions

## Tools and Techniques
- MySQL
- Aggregation functions: SUM, MAX, MIN
- Date functions: YEAR, SUBSTRING
- Common Table Expressions (CTEs)
- Window functions: DENSE_RANK, OVER

## Sample SQL Query
```sql
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
