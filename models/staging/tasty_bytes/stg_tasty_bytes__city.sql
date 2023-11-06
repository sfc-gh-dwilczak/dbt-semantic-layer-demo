with 
    source as (select * from {{ source('tasty_bytes', 'city') }}),

    renamed as (
        select
            city_id,
            city         as city_name,
            city_population,
            country_id,
            country      as country_name,
            iso_country  as country_iso_code,
            iso_currency as currency_iso_code
        from
            source
    )

select * from renamed