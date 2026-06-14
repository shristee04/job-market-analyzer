# Data Analyst Job Market Analysis

A end-to-end data analysis project on real Glassdoor job postings using Python, MySQL, and Power BI.

## Project Overview
This project takes a messy, real-world dataset of Data Analyst job postings from Glassdoor and cleans it up from scratch — fixing salary formats, handling missing values, and pulling out useful info like which skills each job asks for. The cleaned data is then analysed using MySQL and visualised in an interactive Power BI dashboard.

**Tools Used:** Python (Pandas, NumPy) · MySQL · Power BI · Jupyter Notebook

## Repository Structure
```
├── data_cleaning.ipynb        # Full data cleaning & feature engineering
├── sql_analysis.sql           # 10 business queries in MySQL
├── dashboard.pbix             # Power BI dashboard
└── cleaned_data2.csv          # Final cleaned dataset
```

## Key Findings

| # | Finding |
|---|---------|
| 1 | SQL, Excel, and Python are the top 3 most in-demand skills for Data Analyst roles |
| 2 | Companies with higher ratings tend to offer slightly better salaries |
| 3 | A handful of locations dominate both job count and pay — location matters a lot |
| 4 | Jobs that ask for Python or Machine Learning tend to pay above average |
| 5 | Average salary across all listings is around $2.25K/month with 2,252 total jobs analysed |

## What I Did

### Data Cleaning (Python)
The raw dataset was quite messy — here's what I fixed:
- Salary was a text string like `'$53K-$91K (Glassdoor est.)'` — wrote a custom function to extract clean min/max/avg salary numbers
- Replaced all `-1` values (used as missing placeholders) with proper `NaN`
- Removed company ratings that were stuck onto company names
- Split `Location` into separate `City` and `State` columns
- Added a `company_age` column from the founding year
- Scanned every job description for 10 skills (Python, SQL, Excel, Tableau, Power BI, R, Machine Learning, Statistics, Pandas, Spark) and added a 0/1 column for each
- Standardised all column names to `snake_case`

### Business Queries (MySQL)
10 queries were run on the cleaned data to answer real job market questions:

| Query | What It Finds |
|-------|---------------|
| Top hiring companies | Which 10 companies posted the most Data Analyst jobs |
| Salary by job title | Average salary for the top 10 job titles |
| Top locations | Cities with the most postings and best pay |
| Most in-demand skills | Which skills appear most across all job postings |
| Rating vs salary | Do higher-rated companies pay more? |
| Python vs SQL | Jobs asking for Python only, SQL only, both, or neither |
| Salary distribution | How jobs split across salary ranges |
| High-paying skills | Which skills appear most in above-average salary jobs |
| Skills by job title | Which titles ask for which skills the most |
| Best-paying locations | Top 10 locations by salary (min. 5 job postings) |

### Dashboard (Power BI)
Built an interactive dashboard called **Job Market Analyser** showing:
- Top hiring companies and locations
- Most in-demand skills across all postings
- Salary distribution and averages
- How company ratings relate to pay
- Filters for salary range, rating, and location
