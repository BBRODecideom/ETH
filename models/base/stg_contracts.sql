{{config(materialized='incremental', incremental_strategy='delete+insert', on_schema_change='fail' ) }}

select
    address,
    block_hash,
    bytecode,
    date,
    last_modified
from {{ source('eth', 'contracts') }}
