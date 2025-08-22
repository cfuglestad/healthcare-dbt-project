
    
    

with all_values as (

    select
        readmission_flag as value_field,
        count(*) as n_records

    from "dev"."main"."fct_admissions"
    group by readmission_flag

)

select *
from all_values
where value_field not in (
    '0','1'
)


