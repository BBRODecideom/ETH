--{{config(materialized='incremental', incremental_strategy='delete+insert', on_schema_change='fail' ) }}
{{config(materialized='incremental', incremental_strategy='microbatch', begin='2026-06-01', event_time='date', batch_size='day', concurrent_batches=false ) }}

select
    address,
    block_hash,
    bytecode,
    date,
    last_modified
from {{ source('eth', 'contracts') }}

