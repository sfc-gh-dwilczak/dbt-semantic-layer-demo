with
    source as (select * from {{ source('tasty_bytes', 'order_header') }}),

    renamed as (
        select
            order_id,
            truck_id,
            location_id,
            customer_id,
            discount_id,
            shift_id,
            shift_start_time,
            shift_end_time,
            order_channel,
            order_ts  as ordered_at,
            served_ts as served_at,
            order_currency,
            order_amount,
            order_tax_amount,
            order_discount_amount,
            order_total
        from
            source
    )

select * from renamed