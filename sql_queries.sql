-- SQL project1:
-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
/* select * from sales 
 	where sales_date ='2022-11-05';
*/

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
/* SELECT * from sales 
       WHERE
       category='Clothing'
       and 
       sales_date BETWEEN '2022-11-01' and '2022-11-30'
       and
       quantity>1; 
*/
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- select category, sum(total_sales) as totalsale from sales
-- group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
/* select AVG(age) from sales
where category='Beauty'; 
*/

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
/* SELECT * from sales
where total_sales>1000;
*/

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
/* select category,gender, count(transaction_id) from sales
group by category, gender;
*/

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
/* with rankedsales as (SELECT sales_date, year(sales_date) as sales_year, month(sales_date) as sales_month,round(AVG(total_sales),2) as totalsale,
 rank() over(PARTITION by year(sales_date) order by round(avg(total_sales),2) desc) as sales_rank
from sales
group by sales_year,sales_month
order by sales_year, totalsale desc
)
select sales_year,sales_month,totalsale,sales_rank 
from rankedsales 
where sales_rank=1
order by sales_year;
 */         

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
/* select  customer_id, sum(total_sales) as totalsale from sales
group by customer_id
order by totalsale desc
limit 5;
*/

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
/* select category, count(DISTINCT customer_id) as unique_customer
from sales
group by category;
*/

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
/* with hourly_sales as (SELECT *, 
    CASE 
        WHEN HOUR(sales_time) <= 12 THEN 'Morning'
        WHEN HOUR(sales_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift    
	FROM sales
    )
    select shift, count(*) as hour_total
    from hourly_sales
    group by shift;
*/
-- End of project.