
    
    

with all_values as (

    select
        unit as value_field,
        count(*) as n_records

    from "dev"."main"."dim_locations"
    group by unit

)

select *
from all_values
where value_field not in (
    'ED','ICU','Med-Surg','Outpatient','Radiology'
)


