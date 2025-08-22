
  
  create view "dev"."main"."dim_providers__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."stg_providers"
)

select
    provider_id,
    provider_name,
    specialty,
    npi
from source
  );
