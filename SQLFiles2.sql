update superstore.superstore_train 
set `Order Date` = date_format(str_to_date(`Order Date`, '%d/%m/%Y'), '%Y-%m-%d'),
    `Ship Date` = date_format(str_to_date(`Ship Date`, '%d/%m/%Y'), '%Y-%m-%d')
