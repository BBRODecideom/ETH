select 
    --order_id,
    sum(value) as total_amount
from {{ ref('int_transactions_enriched') }}
--group by 1
having total_amount < 0

