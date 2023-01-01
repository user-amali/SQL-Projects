USE superstore;
WITH cte_avgmonthlysales_2017 AS(
	SELECT 
		MONTH(`Order Date`) AS `Order Month`, 
        AVG(Sales) avgnet_sales
	FROM 
		superstore_train
	WHERE 
		YEAR(`Order Date`) = 2017
	GROUP BY 
		  MONTH(`Order Date`)
)
SELECT 
   	`Order Month`,
    avgnet_sales AS `Monthly Sales Averages for 2017`
FROM 
   cte_avgmonthlysales_2017
ORDER BY
   avgnet_sales DESC;