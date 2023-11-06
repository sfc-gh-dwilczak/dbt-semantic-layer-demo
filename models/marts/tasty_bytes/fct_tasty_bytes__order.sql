with
    order_detail as (select * from {{ ref('stg_tasty_bytes__order_detail') }}),
    order_header as (select * from {{ ref('stg_tasty_bytes__order_header') }}),

    denormalized as (
        select
            order_detail.order_detail_id,
            order_id,
            order_header.customer_id,
            order_detail.menu_item_id,
            order_header.location_id,
            order_header.truck_id,
            order_header.ordered_at,
            order_detail.quantity,
            order_detail.price
        from
            order_detail
        left join
            order_header
                using(order_id)
    )

select * from denormalized