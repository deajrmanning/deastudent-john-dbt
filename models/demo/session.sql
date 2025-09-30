{{
    config
    (
        materialized = 'table'
    )
}}

with session_src as
(
    select
    SESSION_ID, 
    USER_ID, 
    BROWSER, 
    DEVICE_TYPE, 
    b.COUNTRY_NAME as COUNTRY_NAME,
    b.CONTINENT as CONTINENT,
    b.CURRENCY as CURRENCY, 
    START_TIME, 
    END_TIME, 
    PAGES_VISITED,
    CURRENT_TIMESTAMP AS INSERT_DTS
    from {{source("session", "SESSION_SRC")}} as a
    left join {{ref("country_code")}} as b
    ON a.COUNTRY_CODE = b.COUNTRY_CODE
)

select * from session_src