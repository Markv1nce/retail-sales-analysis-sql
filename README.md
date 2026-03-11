# retail-sales-analysis-sql
An end-to-end SQL project focused on cleaning raw retail data and performing business-driven exploratory data analysis (EDA) to uncover sales trends, customer behavior, and category performance.



# Retail Sales Analysis Project

## Project Overview

This project demonstrates the application of SQL in a real-world retail environment. I performed extensive data cleaning to prepare the dataset for analysis and then solved 10 specific business problems. The goal was to transform raw sales records into actionable insights regarding customer demographics, peak sales times, and top-performing categories.

## Key Features

* **Data Cleaning:** Handled inconsistent column names, corrected data types for dates and times, and established primary keys for data integrity.
* **Exploratory Data Analysis (EDA):** Used complex SQL queries, including `JOINs`, `GROUP BY`, `Window Functions`, and `Common Table Expressions (CTEs)`.
* **Business Logic:** Developed queries to identify "best-selling months," customer segments by age and gender, and sales shifts (Morning, Afternoon, Evening).

## Database Schema

The analysis is performed on a `retail_sales` table with the following core structure:

* `transactions_id`: Unique identifier for each sale.
* `sale_date` & `sale_time`: Temporal data for trend analysis.
* `customer_id`: Unique ID for tracking repeat customers.
* `category`: Product categories (e.g., Clothing, Beauty).
* `total_sale`: The final revenue generated per transaction.

## Business Problems Solved

1. **Date-Specific Retrieval:** Filtering sales for specific peak dates.
2. **Category & Quantity Analysis:** Identifying high-volume sales in specific months.
3. **Revenue by Category:** Calculating total sales and transaction counts per category.
4. **Customer Demographics:** Finding the average age of customers in high-interest categories like 'Beauty'.
5. **High-Value Transactions:** Identifying all sales exceeding a $1000 threshold.
6. **Gender & Category Trends:** Mapping transaction counts by gender across all product lines.
7. **Time-Series Analysis:** Finding the highest-selling month for every year using `RANK()`.
8. **Customer Loyalty:** Identifying the top 5 customers by total spend.
9. **Unique Reach:** Counting unique customers per category.
10. **Shift Analysis:** Segmenting sales into "Morning," "Afternoon," and "Evening" using `CASE` statements.
