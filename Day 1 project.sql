-- this is importing data using import wizard.

select count(*) from retail_sales;

ALTER TABLE retail_sales
RENAME COLUMN ï»¿transactions_id to transactions_id;

ALTER TABLE retail_sales
RENAME COLUMN quantiy to quantity;

ALTER TABLE retail_sales
MODIFY COLUMN sale_date DATE;

ALTER TABLE retail_sales
MODIFY COLUMN sale_time TIME;

SELECT * FROM retail_sales;

ALTER TABLE retail_sales
ADD CONSTRAINT pk_retail_sales PRIMARY KEY (transactions_id);

ALTER TABLE retail_sales
MODIFY COLUMN gender VARCHAR(15);

ALTER TABLE retail_sales
MODIFY COLUMN category VARCHAR(15);

ALTER TABLE retail_sales
MODIFY COLUMN cogs FLOAT;

ALTER TABLE retail_sales
MODIFY COLUMN price_per_unit FLOAT;

ALTER TABLE retail_sales
MODIFY COLUMN total_sale FLOAT;


-- CORRECTING DATATYPES OR CHANGING IT TO MAKE IT MORE FASTER. 

SELECT * FROM retail_sales 
WHERE cogs = null;
-- 1by1 checking if there is a null. 

-- DATA ANALYSIS & BUSINESS KEY PROBLEMS & ANSWER

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of nov-2022
SELECT *
FROM retail_sales
WHERE sale_date LIKE '2022-11-%' AND quantity >= 4 AND category = 'Clothing';

-- Q3. Write a Sql query to calculate   the total sales (tota_sale) for each category.
SELECT 
	category,
	SUM(total_sale) as "Total Sale",
    COUNT(*) as "Total Count"
FROM retail_sales
GROUP BY category;

-- Q4. Write a Sql query to find the average age of customers who purchased items from the 'Beauty' category. 
SELECT 
category, ROUND(AVG(age),2) as AVG_AGE
FROM retail_sales
WHERE category = 'Beauty';

-- Q5. Write a Sql query to find all transactions where the total_sale is greater than 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q6. Write a Sql query to find the total number of transactions (transactions_id) made by each gender in each category.
SELECT
category,
gender,
count(*)
FROM retail_sales
group by category, gender order by 1;

-- Q7. Write a Sql query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
	year, 
	month,
	avg_sale
    FROM (
		SELECT 
			EXTRACT(YEAR FROM sale_date) as year,
			EXTRACT(MONTH FROM sale_date) as month,
			AVG(total_sale) as avg_sale,
			RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as ranking
		FROM retail_sales
		GROUP BY 1,2
) as t1
WHERE ranking = 1;

-- Q8. Write a Sql query to find the top 5 customers based on the highest total sales

SELECT 
	customer_id,
    sum(total_sale) 
FROM retail_sales
GROUP BY 1 
ORDER BY 2 desc
LIMIT 5;

-- Q9. Write a Sql query to find the number of unique customers who purchased items from each category. 
SELECT 
	category,
    count(DISTINCT customer_id) as unique_customer
FROM retail_sales
group by category;

-- 10. Write a Sql query to create each shift and number of orders(Example Morning <=12, Afternoon Beetween 12 & 17, Evening >17 

-- SELECT EXTRACT(HOUR FROM sale_time) FROM retail_sales;
-- SELECT * FROM retail_sales;
WITH hourly_sale AS (
SELECT *,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN "Morning"
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN "Afternoon" 
        ELSE "Evening"
	END as shift
FROM retail_sales
)
SELECT shift,
COUNT(total_sale) AS total_orders
FROM hourly_sale
GROUP BY shift;

-- DAY 1 PROJECT DONE. :)

