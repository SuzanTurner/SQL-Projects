
DROP TABLE IF EXISTS zepto;


CREATE TABLE zepto (
        category VARCHAR NOT NULL,
        name VARCHAR NOT NULL,
        mrp DECIMAL NOT NULL,
        discountPercent DECIMAL NOT NULL,
        availableQuantity DECIMAL NOT NULL,
        discountedSellingPrice DECIMAL NOT NULL,
        weightInGms DECIMAL NOT NULL,
        outOfStock BOOLEAN NOT NULL,
        quantity DECIMAL NOT NULL
);

copy zepto FROM 'D:/Yadh/Projects/SQL/Zepto/zepto_v1_clean.csv' DELIMITER ',' CSV HEADER;

-- Data Exploration
-- Counting Rows
select count(*) from zepto

-- Sample values
select * from zepto
limit 5

-- Check null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or 
discountedSellingPrice is null
or
weightInGms is null
or 
outOfStock is null
or 
quantity is null
-- No null values

-- Different product categories
select distinct(category) from zepto

-- Products in stock vs out of stock
SELECT COUNT(*) AS instock_count
FROM zepto
WHERE outOfStock != 'TRUE';
SELECT COUNT(*) AS outofstock_count
FROM zepto
WHERE outOfStock = 'TRUE';

---
SELECT 
    COUNT(*) FILTER (WHERE outOfStock != 'TRUE') AS instock_count,
    COUNT(*) FILTER (WHERE outOfStock = 'TRUE')  AS outofstock_count
FROM zepto;

-- Product names present multiple times
SELECT name, COUNT(*) AS occurrences
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
order by occurrences desc

-- Data Cleaning

-- Products with price 0
select * from zepto 
where mrp = 0 or discountedSellingPrice = 0

delete from zepto
where mrp = 0 or discountedSellingPrice = 0

-- Convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto

-- Q1. Find top 10 best value products based on discount percentage
select distinct name, mrp, discountPercent from zepto
order by discountPercent desc
limit 10

-- Q2. What are products with high mrp but out of stock
SELECT distinct name, mrp, outOfStock
FROM zepto
WHERE outOfStock = 'TRUE'
ORDER BY mrp DESC;

-- Q3. Calculate estimated revenue for each category
select category,
sum(discountedSellingPrice * availableQuantity) as revenue
from zepto
group by category

-- Q4. Find all products where mrp is greater than 500 and discount is less than 10%
select * from zepto 
where mrp > 500 and discountPercent <  10

-- Q5. Find top 5 categories having highest average discount percentage
SELECT category,
       AVG(discountPercent) AS averageDiscount
FROM zepto
GROUP BY category
ORDER BY averageDiscount DESC
LIMIT 5;

-- Q6. Find price per gram of products above 100g and display best value
SELECT distinct name,
       weightInGms,
       discountedSellingPrice,
       (discountedSellingPrice::numeric / weightInGms) AS pricePerGram
FROM zepto
WHERE weightInGms > 100
ORDER BY pricePerGram DESC
LIMIT 10;

-- Q7. Group Products into categories of light, mid and heavy based on weight
select name, weightInGms,
case when weightInGms < 1000 then 'Light'
when weightInGms < 2000 then 'Mid'
else 'heavy'
end as weightCategory
from zepto

-- Q8. What is total inventory weight per category
SELECT category,
       SUM(weightInGms * quantity) AS categoryWeight
FROM zepto
GROUP BY category
ORDER BY categoryWeight DESC;

