with source as (
    select * from {{ ref('patients') }}
),

renamed as (
    select
        patient_id,
        lower(first_name) as first_name,
        lower(last_name) as last_name,
        birthdate,
        gender,
        race,
        zip
    from source
)

select * from renamed
