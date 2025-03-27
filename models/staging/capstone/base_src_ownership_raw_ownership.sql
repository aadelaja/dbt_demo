with source as (
        select * from {{ source('src_ownership', 'raw_ownership') }}
  ),
  renamed as (
      select
          {{ adapter.quote("primary_key") }},
        {{ adapter.quote("Project_Org") }},
        {{ adapter.quote("Vendor") }},
        {{ adapter.quote("Project") }},
        {{ adapter.quote("Organization") }},
        {{ adapter.quote("Leader_Owner") }},
        {{ adapter.quote("Manager_Owner") }},
        {{ adapter.quote("Department") }},
        {{ adapter.quote("loading_date") }}

      from source
  )
  select * from renamed
    