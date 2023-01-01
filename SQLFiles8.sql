USE superstore;
WITH cte_netsales_2017 AS(
	SELECT 
		`Order Month`, 
        SUM(net_sales) net_sales
	FROM 
		vw_netsales_state
	WHERE 
		`Order Year` = 2017
	GROUP BY 
		  `Order Month`        
)
SELECT 
   	`Order Month`,
    net_sales,
    RANK() OVER (
        ORDER BY net_sales ASC
        ) netsales_rank,
	LAG(net_sales,1) OVER (
		ORDER BY `Order Month`
	) previous_month_sales
FROM 
	cte_netsales_2017;