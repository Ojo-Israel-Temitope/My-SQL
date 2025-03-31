# FirstSales Analysis Project
## Overview
This project involves exploratory data analysis (EDA) of a sales company dataset called FirstSales using SQL. The dataset is structured into four tables:

Customer: Contains customer details.

OrderDetails: Includes specifics details about order items.

Orders: Represents transaction information.

Product: Lists products offered by the company.

### Purpose
The goal is to uncover valuable insights about sales performance, customer behavior, and product trends to assist in strategic decision-making.

### Key Features
SQL Queries for extracting and analyzing data.

Exploration of Relationships across the four tables.

Actionable Insights for optimizing sales and product inventory.

### Example Insights

1.Classifying products by price

```sql
--Classify products by price--
SELECT ProductName,Price,
CASE WHEN Price> 100 THEN 'Expensive'
WHEN Price BETWEEN 50 AND 100 THEN 'Moderate'
ELSE 'Affordable'
END AS PriceCategory
FROM Products;
```
### Result
The query categorizes products based on their price into three groups: Expensive, Moderate, and Affordable. The results reveal that most products are Expensive, with very few in the Affordable and Moderate categories, indicating a focus on high-priced items.

2.Classifying Customers by Registration Date
```sql
--Classify Customers by Registration Date--
SELECT FirstName, LastName, RegistrationDate,
CASE WHEN YEAR(RegistrationDate) > 2023
then 'New'
ELSE 'Old' End as CustomerType
FROM Customers;
```
### Result
The query categorizes customers as 'New' or 'Old' based on their registration dates, with those registered after October 2023 classified as 'New' and others as 'Old,' showing clear patterns in customer classification.

3.The most valuable customer
```sql
--highest spending customers--     
select top 1 FirstName,LastName, TotalPrice
from Customers C
join NEWOrderDetails N
on c.CustomerID=N.ProductID
order by TotalPrice desc;
```
### Result
The query above shows the customer with the customer with the highest purchase amount.

4.Combining two different columns
```sql
--concat customer full name and phonenumber--
select
concat(FirstName,' - ',LastName,'  -  ', Phone) as Customer_Contact
from Customers;
```

5.Categorizing products by stock level
```sql
--Categorize products by stock level--
select ProductName,StockQuantity,
case 
when StockQuantity> 100 then 'OverStock'
when StockQuantity between 50 and 100 then 'AdequateStock'
else 'LowStock'
end as Stock_Level
from Products;
```
