SELECT `Order Year`,
	   `Order Month`,
       state,
       net_sales,
       LEAD(net_sales, 1) 
       OVER( ORDER BY `Order Year`,
                      `Order Month`,
                       state ) AS 'Next Sales'
FROM vw_netsales_state;
