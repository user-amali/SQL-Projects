USE superstore;
WITH cte_avgnetsales_2017 AS(
	SELECT 
		`Order Date`, 
        AVG(Sales) avgnet_sales
	FROM 
		superstore_train
	WHERE 
		YEAR(`Order Date`) = 2017
	GROUP BY 
		  `Order Date`        
)
SELECT 
   	`Order Date`,
    avgnet_sales AS `Daily Sales Averages for 2017`
FROM 
   cte_avgnetsales_2017
ORDER BY
   `Order Date`;