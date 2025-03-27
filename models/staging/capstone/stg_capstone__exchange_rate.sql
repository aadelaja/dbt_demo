select *
from {{ source('src_exchange_rates', 'raw_monthly_usd_cad_exchange_rate') }}