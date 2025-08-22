{% test no_overlapping_admissions(model, patient_id_col, admit_col, discharge_col) %}

    with ordered as (
        select
            *,
            lag({{ discharge_col }}) over (
                partition by {{ patient_id_col }}
                order by {{ admit_col }}
            ) as prev_discharge
        from {{ model }}
    )

    select *
    from ordered
    where {{ admit_col }} < prev_discharge

{% endtest %}
