📁 DATABASE AND TABLE CREATION
Create Schema elevatelabs;
Purpose:
Creates a new schema (database) named elevatelabs to store all related tables and data for the online sales project.

CREATE TABLE elevatelabs.Online_sales_data (...)
Purpose:
Defines the structure of the Online_sales_data table, including columns for transaction details such as product, pricing, region, and payment method.

📥 DATA LOADING
LOAD DATA INFILE "..." INTO TABLE ...
Purpose:
Loads data from the Online Sales Data.csv file into the Online_sales_data table.

It uses comma , as the field separator.

Quoted fields are enclosed in " to handle values containing commas.

The first row (headers) is skipped using IGNORE 1 ROWS.

Dates are converted to the MySQL format using STR_TO_DATE.

📅 DATE ANALYSIS
SELECT DISTINCT EXTRACT(MONTH FROM Date) AS Order_Month ...
Purpose:
Fetches all unique months (as numbers 1–12) when orders were placed, extracted from the Date column.

📈 MONTHLY REVENUE REPORT
SELECT EXTRACT(YEAR...), EXTRACT(MONTH...), SUM(...) GROUP BY...
Purpose:
Generates a monthly revenue summary grouped by year and month, showing how total revenue varies over time.

SELECT MONTHNAME(Date), SUM(...) GROUP BY MONTHNAME(Date)...
Purpose:
Returns a summarized view of total revenue by month name (e.g., January, February).
Uses ORDER BY FIELD(...) to sort months in chronological order instead of alphabetical order.

💰 AGGREGATE METRICS
SELECT SUM(Total_Revenue) ...
Purpose:
Calculates the total revenue generated across all transactions.

SELECT SUM(Units_Sold) ...
Purpose:
Computes the total number of products sold, summing up all unit sales.

🔢 TRANSACTION & PRODUCT COUNT
SELECT COUNT(DISTINCT Product_Category) ...
Purpose:
Counts the number of unique product categories involved in sales.

SELECT COUNT(DISTINCT Transaction_ID) ...
Purpose:
Determines the total number of individual transactions recorded.

🏷️ CATEGORY-WISE REVENUE (RANKED)
SELECT Product_Category, SUM(...) GROUP BY ... ORDER BY ... DESC
Purpose:
Displays each product category with its corresponding total revenue, sorted from highest to lowest revenue earners.

📆 FILTERING BY DATE RANGE
SELECT * FROM ... WHERE Date BETWEEN '2024-05-01' AND '2024-08-27';
Purpose:
Retrieves all sales transactions that occurred between May 1, 2024 and August 27, 2024, allowing for period-specific analysis.
