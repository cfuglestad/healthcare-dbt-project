{% test fact_references_dimension(fact_model, dim_model, fact_key, dim_key) %}
    select f.*
    from {{ ref(fact_model) }} f
    left join {{ ref(dim_model) }} d
        on f.{{ fact_key }} = d.{{ dim_key }}
    where d.{{ dim_key }} is null
{% endtest %}
