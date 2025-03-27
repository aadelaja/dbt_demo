select *
from {{ source('src_spend', 'feb_spend_2024') }}