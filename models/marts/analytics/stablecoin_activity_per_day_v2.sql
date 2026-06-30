{{ config(tags=['stablecoin'], grants = {'select': ['TESTER'] }) }}

select
    date,
    type,
    {{ conversion('value', 'decimals') }} as total_usd_value
    
from {{ ref("stg_token_transfer") }}
{# This is an internal Jinja comment #}
left join {{ ref('stablecoins' ) }}
on token_address = contract_address

where contract_address is not null
group by date, type
