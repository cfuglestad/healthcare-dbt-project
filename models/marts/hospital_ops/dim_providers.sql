with source as (
    select * from {{ ref('stg_providers') }}
)

select
    provider_id,
    provider_name,
    specialty,
    npi
from source
