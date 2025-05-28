# layoffs-sql-eda
A SQL-based exploratory data analysis (EDA) project on tech company layoffs, using MySQL to uncover trends by industry, company, country, and time.
# 📊 Layoffs SQL EDA Project

## 📁 Project Overview
Exploratory data analysis (EDA) of tech company layoffs using MySQL. This project uncovers trends and insights by company, industry, country, and time through structured SQL queries.

## 🎯 Objectives
- Analyze total layoffs by company, industry, and country
- Track layoffs by year and month
- Identify companies with 100% layoffs
- Use rolling totals to show trends
- Rank top companies by layoffs per year using window functions

## 🛠️ Tools & Skills Used
- SQL (MySQL)
- Aggregation: `SUM()`, `MAX()`, `MIN()`
- Dates: `YEAR()`, `SUBSTRING()`
- Window functions: `DENSE_RANK()`, `OVER()`
- CTEs (Common Table Expressions)

## 📌 Key Insights
- Certain companies had the highest layoffs overall
- Some industries and countries were more affected
- Layoffs peaked during certain months and years
- Rolling totals helped visualize layoff surges over time

## 🧪 Sample SQL Snippet
```sql
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
