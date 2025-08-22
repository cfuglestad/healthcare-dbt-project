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