
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        specialty as value_field,
        count(*) as n_records

    from "dev"."main"."stg_providers"
    group by specialty

)

select *
from all_values
where value_field not in (
    'Internal Medicine','Emergency','Cardiology','Pediatrics','Orthopedics'
)



  
  
      
    ) dbt_internal_test