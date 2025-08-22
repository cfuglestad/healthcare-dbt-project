{% test no_overlapping_admissions(model, column_name, patient_id_col, admit_col, discharge_col, grace_minutes=60) %}
-- Flags an overlap when the next admission starts within the discharge window
-- plus an optional grace period (minutes) to allow transfers/clock jitter.

with ordered as (
    select
        {{ patient_id_col }}  as patient_id,
        {{ admit_col }}       as admit_ts,
        {{ discharge_col }}   as discharge_ts,
        lead({{ admit_col }}) over (
            partition by {{ patient_id_col }}
            order by {{ admit_col }}, {{ discharge_col }}
        )                     as next_admit_ts
    from {{ model }}
    where {{ admit_col }} is not null
      and {{ discharge_col }} is not null
),
violations as (
    select *
    from ordered
    where next_admit_ts is not null
      and next_admit_ts < discharge_ts + ({{ grace_minutes }} * INTERVAL 1 MINUTE)
)

select * from violations
{% endtest %}
