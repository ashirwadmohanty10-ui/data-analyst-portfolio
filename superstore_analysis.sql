SELECT * from s1
limit 10;

Select sum(Sales) as total_sales
 from s1;
 
 SELECT  Category,sum(sales) As total_sales
 FROM S1
 GROUP By Category
 ORDER By Sales Desc;
 
 SELECT "Product Name" ,sum(Sales) AS total_sales
 FROM S1
 GROUP By "Product Name" 
 ORDER By total_sales DESC
 limit 10;
 
 SELECT Region,Count("Order ID") AS Total_order
 FROM S1
 GROUP By Region
 ORDER By Total_order DESC;
 
 SELECT Category,round(avg("Discount"),2) as Avg_discount
 FROM S1
 GROUP By Category
 Order by Avg_discount;
 
 SELECT "Sub-Category",round(sum(Profit),2) AS Total_profit
 from s1
 group by "Sub-Category"
 order by Total_profit Desc;
 
 Select "Order Id","Product Name",Profit
 From S1
 where Profit < 0
 Order BY Profit ASC
 Limit 10;
 
 Select * from s1
 where Region = "West"
 Limit 10;
 
 Select "Product Name", Sales
 FROM S1
 Order By Sales DESC
 LIMIT 1;
 
 
