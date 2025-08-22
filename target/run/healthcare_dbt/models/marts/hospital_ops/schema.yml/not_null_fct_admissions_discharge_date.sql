
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select discharge_date
from "dev"."main"."fct_admissions"
where discharge_date is null



  
  
      
    ) dbt_internal_test