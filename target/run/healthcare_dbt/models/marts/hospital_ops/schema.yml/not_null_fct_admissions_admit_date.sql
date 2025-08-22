
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select admit_date
from "dev"."main"."fct_admissions"
where admit_date is null



  
  
      
    ) dbt_internal_test