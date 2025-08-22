
  
  create view "dev"."main"."dim_locations__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."stg_locations"
)

select
    location_id,
    facility_name,
    unit,
    city,
    state
from source
  );
