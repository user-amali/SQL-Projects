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
	LEAD(net_sales,1) OVER (
		ORDER BY `Order Month`
	) next_month_sales
FROM 
	cte_netsales_2017;
