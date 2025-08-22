
    
    

select
    provider_id as unique_field,
    count(*) as n_records

from "dev"."main"."dim_providers"
where provider_id is not null
group by provider_id
having count(*) > 1


