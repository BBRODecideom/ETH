{{ codegen.generate_source(schema_name='eth_schema', database_name='decideom_lyon', generate_columns= True) }}

{{ codegen.generate_model_yaml(['stg_transactions', 'int_transactions_enriched', 'stablecoin_activity_per_day']) }}


{{ dbt_utils.star(from = ref('int_transactions_enriched', except=['new_field']  ) ) }}
