-- Note that the orders are grouped by order_id and the payment amount is summed
-- A person can split payments on an order between multiple payment options, those records are recorded seperately

with STG_PAYMENT as (

    select 
        ORDERID as order_id
        , SUM(case when status = 'success' then amount end ) as payment_amount

    from RAW.STRIPE.PAYMENT

    group by order_id
)

select * from STG_PAYMENT