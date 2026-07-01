{{ config(materialized = 'view' , tags=['stablecoin']) }}

select
    date,
    transaction_hash,
    token_address,
    value
from {{ source('eth', 'token_transfers') }}

{%- if target.name == 'dev' %}

where date >= dateadd('day', -3, current_date)

{%- elif target.name == 'prod' %}

where date >= dateadd('day', -15, current_date)

{%- endif -%}
