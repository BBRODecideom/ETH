

select *

from {{ ref('int_transactions_enriched') }}

where from_address in ('0x4eeed1d4f7f8437d23bfc861588fd4e819caaf7b',
'0xf4822839101f87d79a0d2f6d3db423c3ea3bebd1'
)

