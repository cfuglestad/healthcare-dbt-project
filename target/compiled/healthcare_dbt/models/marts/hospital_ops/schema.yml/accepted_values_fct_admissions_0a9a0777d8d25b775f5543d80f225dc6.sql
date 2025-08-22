
    
    

with all_values as (

    select
        admission_type as value_field,
        count(*) as n_records

    from "dev"."main"."fct_admissions"
    group by admission_type

)

select *
from all_values
where value_field not in (
    'Emergency','Elective','Urgent'
)


