{{
    config
    (
        materialized='ephemeral'
    )
}}

with base_orders as
(
select
ORDER_ID, 
ORDER_DATE,
CUSTOMER_ID,
case when CUSTOMER_NAME is NULL then 'NA' else UPPER(CUSTOMER_NAME) END AS CUSTOMER_NAME,
CREATED_AT
from {{source("clean_orders", "BASE_ORDERS")}}
where ORDER_DATE is not NULL
)

select * from base_orders