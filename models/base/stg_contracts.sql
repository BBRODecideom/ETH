{{config(materialized='view') }}

select
    address,
    block_hash,
    bytecode,
    date,
    last_modified
from {{ source('eth', 'contracts') }}
