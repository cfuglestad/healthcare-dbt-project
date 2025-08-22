
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select admission_id
from "dev"."main"."fct_admissions"
where admission_id is null



  
  
      
    ) dbt_internal_test