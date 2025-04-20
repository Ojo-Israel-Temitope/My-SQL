--Classify products by price--
SELECT ProductName,Price,
CASE WHEN Price> 100 THEN 'Expensive'
WHEN Price BETWEEN 50 AND 100 THEN 'Moderate'
ELSE 'Affordable'
END AS PriceCategory
FROM Products 

--Classify Customers by Registration Date--
SELECT FirstName, LastName, RegistrationDate,
CASE WHEN YEAR(RegistrationDate) > 2023
then 'New'
ELSE 'Old' End as CustomerType
FROM Customers;

--Classify Orders Based on Customer registration Date--
SELECT OrderID, OrderDate, FirstName, LastName,
CASE WHEN YEAR(RegistrationDate)>=2023 then 'New'
ELSE 'Old'
end as CustomerType
FROM NEWOrders
JOIN Customers
ON NEWOrders.CustomerID=Customers.CustomerID

--Classify customer spending on Orders--
SELECT FirstName, LastName, SUM(TotalAmount) AS TotalSpent,
CASE WHEN SUM(TotalAmount)>1000 THEN 'High_Spender'
WHEN SUM(TotalAmount) BETWEEN 500 AND 1000 THEN 'Moderate_Spender'
else 'Low_Spender'
END AS Spending_Category
FROM Customers C
JOIN NEWOrders N
ON C.CustomerID=N.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName;

--classify orders by quantity of products ordered--
SELECT OrderID, ProductID, Quantity,
CASE 
WHEN Quantity>10 THEN 'Bulk Order'
ELSE 'Regular Orders' End as OrderType
FROM NEWOrderDetails

--Classify states base on customers distribution--
Select State,count(CustomerID) as TotalCustomer,
case
when count(CustomerID)>20 then 'High Population'
when count(CustomerID)  between 10 and 20 then 'Medium Population'
else 'Low Population'
end as Population_Category
from Customers
Group By State         select*from Customers

--Categorize products by stock level--
select ProductName,StockQuantity,
case 
when StockQuantity> 100 then 'OverStock'
when StockQuantity between 50 and 100 then 'AdequateStock'
else 'LowStock'
end as Stock_Level
from Products

--customer who placed orders in 2024--
Select
FirstName, LastName, year(OrderDate)
from NEWOrders N
join Customers C
on n.CustomerID=c.CustomerID
where year(OrderDate) =2024 

--products with sales more than $5000--
select ProductName, TotalPrice
from Products p
join NEWOrderDetails N
on n.ProductID=p.ProductID
where TotalPrice>5000;

--highest spending customers--     
select top 1 FirstName,LastName, TotalPrice
from Customers C
join NEWOrderDetails N
on c.CustomerID=N.ProductID
order by TotalPrice desc

--concat customer full name and pn--
select
concat(FirstName,' - ',LastName,'  -  ', Phone) as Customer_Contact
from Customers

--concat product name and category--
select
concat(ProductName,'  ', Category) as product_category
from Products 

