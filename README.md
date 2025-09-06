# 📚 [Books SQL Project](https://github.com/SuzanTurner/SQL-Projects/tree/main/Books) 

This project demonstrates SQL queries on a simple *Bookstore Database* built from three datasets:

- *Books.xlsx* – book details (title, author, genre, price, stock, year)  
- *Orders.xlsx* – customer orders (order date, quantity, total amount, book ID, customer ID)  
- *Customers.xlsx* – customer information (name, country, city, etc.)  

The Excel sheets are imported into a relational database (PostgreSQL/SQLite/MySQL — any SQL engine works).  
After loading the data, a set of queries is executed to explore and analyze the bookstore.  

## 🚀 Features / Queries
- Retrieve books by genre, year, or price  
- Find customers from specific countries  
- Show orders within a date range  
- Calculate revenue, stock, and sales by genre/author  
- Identify top customers and most popular books  
- Advanced joins and aggregations across all three tables  

> Queries are written with PostgreSQL syntax (double quotes for identifiers).
> Should work with minimal changes on other SQL databases.

---

# [Zepto Dataset Analysis](https://github.com/SuzanTurner/SQL-Projects/tree/main/Zepto)

This repository contains the Zepto dataset loaded into PostgreSQL and explored using SQL queries. The dataset includes product details such as pricing, discounts, stock availability, weights, and categories.

## 📂 Contents
1. zepto_v1_clean.csv → Raw dataset file
2. queries.sql → Analytical SQL queries

## 📊 Sample Queries
- Products with high MRP but out of stock
- Average discount percentage per category
- Total inventory weight per category
- Top 10 products by price per gram
- In-stock vs out-of-stock counts
