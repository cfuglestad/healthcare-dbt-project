
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select length_of_stay
from "dev"."main"."fct_admissions"
where length_of_stay is null



  
  
      
    ) dbt_internal_test