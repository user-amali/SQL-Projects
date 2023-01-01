USE superstore;
WITH cte_avgnetsales_2017 AS(
	SELECT 
		`Order Date`, 
        SUM(Sales) as TotalSales
	FROM 
		superstore_train
	WHERE 
		`Order Date` = 2017
	GROUP BY
        `Order Date`
	ORDER BY
		`Order Date`
)
SELECT 
   	`Order Date`,
    TotalSales AS `Daily Sales 2017`,
    CONVERT(
         avg(TotalSales) OVER(ROWS 
                         BETWEEN UNBOUNDED PRECEDING 
                         AND CURRENT ROW),
		 DECIMAL(10,2)) AS `Moving Averages 2017`
FROM 
   cte_avgnetsales_2017;

