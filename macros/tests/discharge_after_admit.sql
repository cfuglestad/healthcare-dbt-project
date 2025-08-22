{% test discharge_after_admit(model, admit_col, discharge_col) %}
    select *
    from {{ model }}
    where {{ discharge_col }} < {{ admit_col }}
{% endtest %}
