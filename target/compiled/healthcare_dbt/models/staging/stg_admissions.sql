with source as (
    select * from "dev"."main"."admissions"
),

renamed as (
    select
        admission_id,
        patient_id,
        provider_id,
        location_id,
        admit_date,
        discharge_date,
        length_of_stay,
        admission_type
    from source
)

select * from renamed