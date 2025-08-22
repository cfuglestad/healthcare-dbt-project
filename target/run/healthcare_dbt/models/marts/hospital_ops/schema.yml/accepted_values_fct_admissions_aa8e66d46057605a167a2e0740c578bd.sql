
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

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



  
  
      
    ) dbt_internal_test