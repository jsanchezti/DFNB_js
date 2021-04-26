USE AdventureWorks2017;

--SELECT * FROM Sales.SalesOrderHeader;
--SELECT * FROM Sales.SalesOrderDetail;
--SELECT * FROM Production.Product;

SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.SalesOrderDetail;
SELECT * FROM Production.Product;



--Q1: By Order Quantity, what were the five most popular products sold in 2014?

SELECT TOP (5) FORMAT(soh.OrderDate, 'yyyy') AS Order_Date_Year, 
               sod.ProductID, 
               p.Name, 
               p.ProductNumber, 
               p.Color, 
               COUNT(sod.SalesOrderID) AS Sales_Order_Count, 
               SUM(sod.OrderQty) AS Order_Quantity, 
               SUM(sod.LineTotal) AS Sales_Order_Line_Total
FROM Production.Product p
     INNER JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
     INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE FORMAT(soh.OrderDate, 'yyyy') = '2014'
GROUP BY sod.ProductID, 
         p.Name, 
         p.ProductNumber, 
         p.Color, 
         FORMAT(soh.OrderDate, 'yyyy')
ORDER BY Sales_Order_Line_Total DESC;

--Q2: How long are the 7 longest Person names and to whom do they belong? Rank by Full Name length, Last Name Length, First Name Length

SELECT 
	   --TOP(7) p.BusinessEntityID,
	   DISTINCT TOP(7) CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS Full_Name, 
       LEN(CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName)) AS Full_Name_Length,
	   p.FirstName,
	   LEN(p.FirstName) AS First_Name_Length,
	   p.MiddleName,
	   p.LastName,
	   LEN(p.LastName) AS Last_Name_Length
FROM Person.Person p
ORDER BY Full_Name_Length DESC

--Q3: Which Department pays its female workers on average the most per year?


SELECT d.DepartmentID, 
       d.Name, 
       e.Gender, 
       SUM(eph.Rate * 8 * 20 * 12) AS Total_Yearly_Pay, 
       COUNT(eph.BusinessEntityID) AS Business_Entity_ID_Count, 
       AVG(eph.Rate * 8 * 20 * 12) AS Average_Yearly_Pay
FROM HumanResources.Employee e
     INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
     INNER JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
     INNER JOIN HumanResources.EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
WHERE e.Gender = 'F'
GROUP BY d.DepartmentID, 
         d.Name, 
         e.Gender
ORDER BY Average_Yearly_Pay DESC;