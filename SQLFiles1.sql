select *,
      LEAD(Sales, 1) OVER( ORDER BY `Order Date` ) AS 'Next Sales'
from superstore.superstore_train;
