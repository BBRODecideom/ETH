{{ config(group = 'fraud_risk', access = 'private') }}

select 
    t.from_address,
    c.bytecode,
    count(c.bytecode) as bytecode_count

from {{ ref('int_transactions_enriched') }} t

left join {{ ref('stg_contracts') }} c
on t.receipt_contract_address = c.address

where t.transaction_category = 'contract_creation'
and c.bytecode is not null

group by 1,2

--0x4eeed1d4f7f8437d23bfc861588fd4e819caaf7b
--0xf4822839101f87d79a0d2f6d3db423c3ea3bebd1

