USE [exam]
GO
--part A
--Q1
SELECT sum([Quantity]*[UnitPrice])as  total_price
  FROM [dbo].[Sale table]
GO
--Q2
SELECT COUNT(DISTINCT [Customer]) as diff_customer FROM [dbo].[Sale table]
GO
--Q3
SELECT  [Product] ,sum([Quantity])as  total_quantity
  FROM [dbo].[Sale table] group by [Product]
GO
--Q4
SELECT  [Customer] ,sum([Quantity]) as  total_quantity , sum([Quantity]*[UnitPrice]) as  total_price, count(*) as  num_of_receipt 
  FROM [dbo].[Sale table] where [Quantity]*[UnitPrice]>1500 group by [Customer] 
GO
--or

SELECT  a.[Customer],sum([Quantity]) as  total_quantity , sum([Quantity]*[UnitPrice]) as  total_price, count(*) as  num_of_receipt 
FROM 
[dbo].[Sale table] as a
INNER JOIN ( SELECT  [Customer] 
  FROM [dbo].[Sale table] where [Quantity]*[UnitPrice]>1500 group by [Customer] ) as b ON a.[Customer] = b.[Customer]
  group by a.[Customer] 
GO

--Q5
SELECT  sum(a.[Quantity]*a.[UnitPrice]*b.[ProfitRatio]) as profit_price,
		sum(a.[Quantity]*a.[UnitPrice]*b.[ProfitRatio])/sum(a.[Quantity]*a.[UnitPrice])*100 as profit_ratio
  FROM 
  [dbo].[Sale table] a
  INNER JOIN [dbo].[Sale Profit] b ON a.[Product] = b.[Product];
GO


--q6
SELECT count (*) as num_of_cus
FROM (
  SELECT [Customer] ,[Date] 
  FROM [dbo].[Sale table] group by [Customer] ,[Date]  ) as cus_date
 GO



