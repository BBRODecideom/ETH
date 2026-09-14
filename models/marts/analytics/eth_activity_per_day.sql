{{ config( tags=['daily'] ) }}

select 
    date,
    transaction_category,
    count(*) as tx_count,
    {{ ethereum_conversion('value') }} as sum_value_eth

from {{ ref('int_transactions_enriched') }}

group by date, transaction_category

