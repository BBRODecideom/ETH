
{% test assert_value_amount_positive(model, column_name, field) %}
select 
    --order_id,
    {{ field }},
    sum({{ column_name }}) as total_amount
from {{ model }}
--group by 1
group by {{ field }}

having total_amount < 0

{% endtest %}

