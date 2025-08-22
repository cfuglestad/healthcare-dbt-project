
    
    

with all_values as (

    select
        specialty as value_field,
        count(*) as n_records

    from "dev"."main"."dim_providers"
    group by specialty

)

select *
from all_values
where value_field not in (
    'Internal Medicine','Emergency','Cardiology','Pediatrics','Orthopedics'
)


