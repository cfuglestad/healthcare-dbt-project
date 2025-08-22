with source as (
    select * from "dev"."main"."stg_providers"
)

select
    provider_id,
    provider_name,
    specialty,
    npi
from source