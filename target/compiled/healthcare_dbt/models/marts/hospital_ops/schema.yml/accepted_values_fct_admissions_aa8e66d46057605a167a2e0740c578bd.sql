
    
    

with all_values as (

    select
        stay_category as value_field,
        count(*) as n_records

    from "dev"."main"."fct_admissions"
    group by stay_category

)

select *
from all_values
where value_field not in (
    'Short','Medium','Long'
)


