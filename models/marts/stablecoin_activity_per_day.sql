{{ config(tags=['stablecoin']) }}

select
    date,
    token_address,
    type,
    symbol,
    {{ conversion('value', 'decimals') }} as total_usd_value
from {{ ref("stg_token_transfer") }}

left join {{ ref('stablecoins' ) }}
on token_address = contract_address

where contract_address is not null
group by date, token_address, type, symbol
