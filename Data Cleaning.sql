SELECT *
FROM world_layoff.layoffs;



-- 1. Removing Duplicates
-- 2. standardizing Data 
-- 3. Null/ Blank values 
-- 4. Remove unnecessary column/rows 

-- first we are going to create a duplicated data base of Layoffs. 

CREATE TABLE layoffs_staging 
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging 
SELECT *
FROM layoffs;

-- HOW TO REMOVE DUPLICATE --

SELECT *,
ROW_NUMBER () OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
( 
SELECT *,
ROW_NUMBER () OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT*
FROM Duplicate_cte
WHERE row_num > 1;

-- after doing this you check --

SELECT *
FROM layoffs_staging
WHERE company = 'Oda';

CREATE TABLE `layoffs_staging2`
 (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER () OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;

-- Standardizing data is find issues in your data and fixing it --

-- we are now looking at the comapny column and we are using trim to remove the white spaces to 
-- make it equal.--

SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2 
SET comapny = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2 
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2 
SET industry  = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- so if you want to take out a dot at the end of a word there is a trailing method. --

SELECT *
FROM layoffs_staging2;

SELECT DISTINCT country 
FROM layoffs_staging2 
ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;



UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- CHANGING THE DATE FORMATE--



SELECT  *
FROM layoffs_staging2;

SELECT `date`,
       STR_TO_DATE(`date`, '%m/%d/%y') 
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%y');


ALTER TABLE layoffs_staging2
MODIFY COLUMN `date`  DATE;

SELECT *
FROM layoffs_staging2;

-- Now we are working with null values and blank spaces in data --

SELECT industry 
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = ' ';


SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

UPDATE layoffs_staging2
SET industry = NULL
WHERE TRIM(industry) = '' OR industry IS NULL;

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company 
WHERE (t1.industry IS NULL OR t1.industry = '')
  AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company 
SET t1.industry = t2.industry 
WHERE t1.industry IS NULL 
  AND t2.industry IS NOT NULL;
  
  
  -- REMOVE COLUMN AND ROWS THAT WE DO NOT NEED. 
  
  SELECT * 
  FROM layoffs_staging2
  WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
  DELETE 
  FROM layoffs_staging2
  WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
  SELECT *
  FROM layoffs_staging2;
  
  ALTER TABLE layoffs_staging2
  DROP COLUMN row_num;








































































































































































































































