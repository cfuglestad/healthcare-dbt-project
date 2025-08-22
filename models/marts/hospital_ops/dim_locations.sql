with source as (
    select * from {{ ref('stg_locations') }}
)

select
    location_id,
    facility_name,
    unit,
    city,
    state
from source
