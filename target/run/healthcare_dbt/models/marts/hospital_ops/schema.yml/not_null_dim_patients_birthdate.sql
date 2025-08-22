
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select birthdate
from "dev"."main"."dim_patients"
where birthdate is null



  
  
      
    ) dbt_internal_test