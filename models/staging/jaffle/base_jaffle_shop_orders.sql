with source as (
        select * from {{ source('jaffle_shop', 'orders') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }},
        {{ adapter.quote("USER_ID") }},
        {{ adapter.quote("ORDER_DATE") }},
        {{ adapter.quote("STATUS") }},
        {{ adapter.quote("_etl_loaded_at") }}

      from source
  )
  select * from renamed
    