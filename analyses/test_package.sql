{{ codegen.generate_source(schema_name='eth_schema', database_name='eth', generate_columns= True) }}

{{ codegen.generate_model_yaml(schema_name='eth_schema', database_name='eth') }}

{{ dbt_utils.star(from = ref('int_transactions_enriched', except=['new_field']  ) ) }}
