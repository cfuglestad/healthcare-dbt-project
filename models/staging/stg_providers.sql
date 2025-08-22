with source as (
    select * from {{ ref('providers') }}
),

renamed as (
    select
        provider_id,
        name as provider_name,
        specialty,
        npi
    from source
)

select * from renamed
