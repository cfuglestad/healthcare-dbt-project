
  
  create view "dev"."main"."fct_admissions__dbt_tmp" as (
    with admissions as (
    select * from "dev"."main"."stg_admissions"
),

patients as (
    select * from "dev"."main"."dim_patients"
),

providers as (
    select * from "dev"."main"."dim_providers"
),

locations as (
    select * from "dev"."main"."dim_locations"
),

-- sort admissions for window functions
ranked as (
    select
        *,
        row_number() over (partition by patient_id order by admit_date) as admission_number,
        lag(discharge_date) over (partition by patient_id order by admit_date) as prev_discharge_date
    from admissions
),

-- add derived fields
final as (
    select
        a.admission_id,
        a.admit_date,
        a.discharge_date,
        a.length_of_stay,
        a.admission_type,

        case
            when a.length_of_stay <= 2 then 'Short'
            when a.length_of_stay <= 5 then 'Medium'
            else 'Long'
        end as stay_category,

        r.admission_number,
        datediff('day', r.prev_discharge_date, a.admit_date) as days_since_last_admission,
        case
            when datediff('day', r.prev_discharge_date, a.admit_date) <= 30 then 1
            else 0
        end as readmission_flag,

        a.patient_id,
        p.first_name as patient_first_name,
        p.last_name as patient_last_name,
        p.gender,
        p.race,
        p.zip,

        a.provider_id,
        pr.provider_name,
        pr.specialty,

        a.location_id,
        l.facility_name,
        l.unit,
        l.city,
        l.state

    from ranked r
    left join admissions a on r.admission_id = a.admission_id
    left join patients p on a.patient_id = p.patient_id
    left join providers pr on a.provider_id = pr.provider_id
    left join locations l on a.location_id = l.location_id
)

select * from final
  );
