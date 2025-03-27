select *
from {{ source('src_ownership', 'raw_ownership') }}