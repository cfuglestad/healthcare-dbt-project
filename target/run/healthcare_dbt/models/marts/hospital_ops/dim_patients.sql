
  
  create view "dev"."main"."dim_patients__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."stg_patients"
)

select
    patient_id,
    first_name,
    last_name,
    birthdate,
    gender,
    race,
    zip
from source
  );
