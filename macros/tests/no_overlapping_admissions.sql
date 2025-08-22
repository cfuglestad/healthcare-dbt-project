{% test no_overlapping_admissions(model, column_name, patient_id_col, admit_col, discharge_col) %}
-- Fails if any two admissions for the same patient overlap.
-- Overlap when: A.start < B.end  AND  A.end > B.start
-- We avoid self/dupe pairs by forcing A.start < B.start.

with base as (
    select * from {{ model }}
),
overlaps as (
    select
        a.{{ patient_id_col }} as patient_id,
        a.{{ admit_col }}      as a_start,
        a.{{ discharge_col }}  as a_end,
        b.{{ admit_col }}      as b_start,
        b.{{ discharge_col }}  as b_end
    from base a
    join base b
      on a.{{ patient_id_col }} = b.{{ patient_id_col }}
     and a.{{ admit_col }} <  b.{{ admit_col }}
     and a.{{ discharge_col }} > b.{{ admit_col }}
)
select * from overlaps
{% endtest %}
