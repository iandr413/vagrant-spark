SELECT `customer_demographics`.`cd_gender` AS `cd_gender`,
`customer_demographics`.`cd_marital_status` AS `cd_marital_status`,
SUM(`store_sales`.`ss_net_paid`) AS `temp_calculation_270497503668056079__3925954030__0_`,
SUM(`store_returns`.`sr_return_amt`) AS `temp_calculation_270497503668056079__918835630__0_`
FROM `${DB}`.`store_sales` `store_sales`
JOIN `${DB}`.`item` `item` ON (`store_sales`.`ss_item_sk` = `item`.`i_item_sk`)
JOIN `${DB}`.`customer` `customer` ON (`store_sales`.`ss_customer_sk` = `customer`.`c_customer_sk`)
JOIN `${DB}`.`customer_address` `customer_address` ON (`customer`.`c_current_addr_sk` = `customer_address`.`ca_address_sk`)
JOIN `${DB}`.`store` `store` ON (`store_sales`.`ss_store_sk` = `store`.`s_store_sk`)
JOIN `${DB}`.`customer_demographics` `customer_demographics` ON (`customer`.`c_current_cdemo_sk` = `customer_demographics`.`cd_demo_sk`)
JOIN `${DB}`.`date_dim_date` `date_dim_date` ON (`store_sales`.`ss_sold_date_sk` = `date_dim_date`.`d_date_sk`)
JOIN `${DB}`.`store_returns` `store_returns` ON (`date_dim_date`.`d_date_sk` = `store_returns`.`sr_returned_date_sk`)
GROUP BY `customer_demographics`.`cd_gender`,
`customer_demographics`.`cd_marital_status` ;

