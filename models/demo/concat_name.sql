{{
    config
    (
        materialized='table'
    )
}}

select {{ concat_macro('john', 'smith') }} as name