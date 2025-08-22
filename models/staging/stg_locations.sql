with source as (
    select * from {{ ref('locations') }}
),

renamed as (
    select
        location_id,
        facility_name,
        unit,
        city,
        state
    from source
)

select * from renamed
