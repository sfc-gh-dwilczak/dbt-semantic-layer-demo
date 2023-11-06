with
    customer as (select * from {{ ref('stg_tasty_bytes__customer') }}),
    orders as (select * from {{ ref('stg_tasty_bytes__order_header') }}),

    date_ranges as (

        select
            min(sign_up_date::date) as start_on,
            max(sign_up_date::date) as stop_on
        from
            customer
        
        union all

        select
            min(ordered_at::date) as start_on,
            max(ordered_at::date) as stop_on
        from
            orders
    ),

    total_date_range as (
        select
            min(start_on) as start_on,
            max(stop_on) as stop_on
        from
            date_ranges
    ),

    dates as (
        select
            min(start_on) as date_day,
            max(stop_on) as final_date
        from
            date_ranges
        
        union all

        select
            dates.date_day + interval '1 day' as date_day,
            dates.final_date
        from
            dates
        where
            dates.date_day < dates.final_date
    )

select date_day from dates
