{% test fact_references_dimension(model, column_name, fact_model, dim_model, fact_key, dim_key) %}
-- Ensure every fact key has a matching dimension key.
-- 'model' is already the fact relation under test; we still accept fact_model to match your YAML.

with fact as (
  select {{ fact_key }} as fk
  from {{ model }}
  where {{ fact_key }} is not null
),
dim as (
  select {{ dim_key }} as dk
  from {{ ref(dim_model) }}
)
select f.fk
from fact f
left join dim d on d.dk = f.fk
where d.dk is null
{% endtest %}
