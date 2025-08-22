with source as (
    select * from "dev"."main"."providers"
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