
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select admission_number
from "dev"."main"."fct_admissions"
where admission_number is null



  
  
      
    ) dbt_internal_test