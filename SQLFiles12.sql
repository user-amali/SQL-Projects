WITH cte_netsales AS (
  SELECT `Order Date`,
         Discount,
         date_add( `Order Date`, 
                   interval(- ROW_NUMBER() OVER(ORDER BY `Order Date`)) day) col1
  FROM 
     superstore.superstore_train
  GROUP BY 
		  `Order Date`        
)
SELECT MIN(`Order Date`), MAX(`Order Date`), MIN(Discount), MAX(Discount)
FROM cte_netsales
GROUP BY col1
ORDER BY MAX(Discount) DESC;
	
