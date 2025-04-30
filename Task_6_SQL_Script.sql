##ONLINE SALES DATA##

#Creating a new table to load the Online_sales_data

CREATE table elevatelabs.Online_sales_data (
	Transaction_ID INT,
    Date DATE,
    Product_Category VARCHAR(20),
    Product_Name VARCHAR(270),
    Units_Sold INT,
    Unit_Price INT,
    Total_Revenue INT,
    Region VARCHAR(20),
    Payment_Method VARCHAR(20)
);

#LODING DATA TO THE TABLE CREATED
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 9.2\\Uploads\\Online Sales Data.csv"
INTO TABLE ElevateLabs.online_sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Transaction_ID, @Date, Product_Category, Product_Name, Units_Sold, Unit_Price, 
Total_Revenue, Region, Payment_Method)
SET Date = STR_TO_DATE(@Date, '%d-%m-%Y');

 
 ##Use EXTRACT(MONTH FROM order_date) for month
select distinct extract(month from Date) as Order_Month
from elevatelabs.online_sales_data;

##GROUP BY year/month.
SELECT 
	EXTRACT(YEAR FROM Date)AS Order_Year,
    EXTRACT(MONTH FROM Date)AS Order_Month,
    SUM(Total_Revenue)AS Monthly_Revenue
FROM
	elevatelabs.online_sales_data
GROUP BY 
	Order_Year, Order_Month;
 
 ##GROUP BY YEAR/MONTH
select
	monthname(Date) as month_name,
	sum(Total_Revenue) as Revenue_by_month
from elevatelabs.online_sales_data
group by month_name
order by field(month_name, 'January','February', 'March','April','May','June',
'July','August','September','October','November','December');

##Use SUM() for revenue.
select sum(Total_Revenue) as Total_Revenue
from elevatelabs.online_sales_data;

select sum(Units_Sold) as Total_products_sold
from elevatelabs.online_sales_data;

##COUNT(DISTINCT order_id) for volume.

select count(distinct Product_Category) as Products
from elevatelabs.online_sales_data;

select count(distinct transaction_ID) as Total_transactions
from elevatelabs.online_sales_data;

## Use ORDER BY for sorting.
select 
	product_category,
    sum(Total_Revenue) as Total_Revenue
from 
	elevatelabs.online_sales_data
group by
	Product_Category
order by
	Total_Revenue desc;

## Limit results for specific time periods.
select *
from elevatelabs.online_sales_data
where Date between '2024-05-01' and '2024-08-27';

