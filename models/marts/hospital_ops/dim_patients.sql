with source as (
    select * from {{ ref('stg_patients') }}
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
