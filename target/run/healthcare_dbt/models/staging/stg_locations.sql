
  
  create view "dev"."main"."stg_locations__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."locations"
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
  );
