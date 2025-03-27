with ownership as  (
    select * from {{ ref('stg_capstone__ownership' )}}
),

exchange_rates as (
    select * from {{ ref('stg_capstone__exchange_rate') }}
),

feb_spend as (
    select
        invoiceSectionName as spend_dept,
        exchangeRatePricingToBilling as exchange_rate,
        exchangeRateDate as exchange_rate_date,
        sum(paygCostInBillingCurrency) as amount_cad,
        sum(paygCostInBillingCurrency * exchangeRatePricingToBilling) as amount_usd
    from {{ ref('stg_capstone__spend') }}
    group by 1, 2, 3
),

final as (

    select
        feb_spend.spend_dept,
        sum(feb_spend.amount_cad) as amount_cad,
        sum(feb_spend.amount_usd) as amount_usd

    from feb_spend
    group by 1
    order by 2 desc
)

select * from final