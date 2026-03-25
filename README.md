# SQL Cinema Analytics

## Project Overview

This project performs relational database analysis using SQL Server on a restored movie rental database (dvdrental).

The objective is to extract business insights from transactional data related to movie rentals, customer activity, actor participation, and store-level sales performance.

The project focuses entirely on structured querying and analytical SQL techniques within a relational schema.

---

## Database Setup

The database was restored locally using SQL Server Management Studio (SSMS) from a backup file:

dvdrental.bak

After restoration, the working environment was initialized using:

USE dvdrental;

All queries were executed against this relational database.

---

## Analytical Scope

The project explores multiple business-oriented questions, including:

Rental Activity Analysis
- Identifying movies that were never rented  
- Determining the most rented movies  
- Counting how many times each movie was rented  
- Detecting movies rented more than once  

Customer Behavior
- Identifying customers who never rented a movie  
- Counting customers per store  
- Analyzing rental frequency per customer  

Actor Analysis
- Listing actors and their film participation  
- Identifying actors who have appeared in more than 30 films  

Store Performance
- Calculating total sales per store  
- Comparing revenue generation between store locations  

---

## SQL Techniques Applied

This project demonstrates practical application of:

- SELECT statements  
- WHERE filtering  
- LIKE operator  
- INNER JOIN  
- LEFT JOIN  
- GROUP BY  
- ORDER BY  
- COUNT()  
- SUM()  
- Subqueries  
- Common Table Expressions (CTEs)  

The queries combine relational joins and aggregation logic to transform transactional data into analytical insights.

---

## Business Insight Orientation

Rather than focusing on database administration, the emphasis of this project is analytical querying.

Each query is structured to answer a clear business question, simulating real-world data analysis scenarios within a transactional database.

---

## Tools Used

- SQL Server  
- SQL Server Management Studio (SSMS)  
- T-SQL
