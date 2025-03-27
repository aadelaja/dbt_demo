with source as (
        select * from {{ source('src_exchange_rates', 'raw_monthly_usd_cad_exchange_rate') }}
  ),
  renamed as (
      select
          {{ adapter.quote("Date") }},
        {{ adapter.quote("FXMUSDCAD") }},
        {{ adapter.quote("Timestamp") }}

      from source
  )
  select * from renamed
    