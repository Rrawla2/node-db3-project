-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Product.ProductName, Category.CategoryName FROM Product
JOIN Category
WHERE Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Shipper.CompanyName, [Order].Id, [Order].OrderDate FROM Shipper
JOIN [Order]
WHERE [Order].OrderDate < "2012-08-09"
GROUP BY [Order].Id

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity, OrderDetail.OrderId AS [Order] FROM [OrderDetail]
JOIN Product ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251
ORDER BY Product.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id AS "Order ID", Customer.CompanyName AS "Customer's Company Name", Employee.LastName AS "Employee's Last Name" FROM [Order]
JOIN Customer ON Customer.Id = [Order].CustomerId
JOIN Employee ON Employee.Id = [Order].EmployeeId
WHERE [Order].Id