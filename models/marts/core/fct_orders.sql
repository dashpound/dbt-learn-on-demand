-- Requirements
    -- order_id
    -- customer_id
    -- amount

with payment as (

    select 
        order_id
        , payment_amount as amount 
    from 
        {{ref('stg_payments')}}

), 

orders as (

    select 
        customer_id
        , order_id
   
    from 
        {{ref('stg_orders')}}
), 

fct_orders as (
    
    select 
        payment.order_id as order_id
        , orders.customer_id as customer_id
        , payment.amount as amount

    from payment
    left join orders using (order_id)

)

select * from fct_orders