CREATE TABLE retail (
        transactions_id DECIMAL NOT NULL,
        sale_date DATE NOT NULL,
        sale_time INTERVAL NOT NULL,
        customer_id DECIMAL NOT NULL,
        gender VARCHAR NOT NULL,
        age DECIMAL,
        category VARCHAR NOT NULL,
        quantiy DECIMAL,
        price_per_unit DECIMAL,
        cogs DECIMAL,
        total_sale DECIMAL
);

-- Copy data
copy retail FROM 'D:/Yadh/Projects/SQL/Retail/Retail.csv' DELIMITER ',' CSV HEADER;

-- Sample data
select * from retail
limit 5

-- Count rows
select count(*) as total
from retail

-- Finding null values
select * from retail
where transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or 
age is null
or
category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null

-- Deleting null items
delete from retail
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or 
age is null
or
category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null

-- Counting rows again after deleting
select count(*) as total
from retail

-- Data Exploration

-- How many customers do we have?
select count(distinct customer_id) from retail

-- How many categories are there?
select count(distinct category) from retail

-- Find sales made on '2022-11-5'
select * from retail
where sale_date = '2022-11-05'

select sum(total_sale) as total_sale from retail
where sale_date = '2022-11-05'

-- Category = Clothing, qty >= 4in Nov 2022
select sum(total_sale) from retail
where category = 'Clothing' and
quantiy >= 4 and
sale_date between '2022-11-01' and '2022-11-30'

-- Find total sales of each category
select category, sum(total_sale), count(*) as total_orders from retail
group by category

-- Find average age of customers who purchased from the beauty category
select round(avg(age), 2) from retail
where category = 'Beauty'

-- Find all transactions where total_sale > 1000
select * from retail
where total_sale > 1000

-- Find number of transactions made by each gender in each category
select gender, category, count(*) from retail
group by gender, category
order by count 

-- Find average sale for each month
SELECT EXTRACT(YEAR FROM sale_date) AS year,
       EXTRACT(MONTH FROM sale_date) AS month,
       round(AVG(total_sale),2) AS average_sale
FROM retail
GROUP BY year, month
ORDER BY average_sale DESC;

-- Find top 5 customers based on highest total sales
SELECT customer_id,
       SUM(total_sale) AS total_sales
FROM retail
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Find number of unique customer who purchased items from each category
select category, count(distinct customer_id) from retail
group by category

-- Create shifts based on time of orders, such as morning, afternoon, evening
select * ,
case when sale_time between '8:00:00' and '12:00:00' then 'Morning'
when sale_time between '12:00:01' and '4:00:00' then 'Afternoon'
else 'Evening'
end as "Shift"
from retail

