
  
  create view "dev"."main"."stg_providers__dbt_tmp" as (
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
  );
