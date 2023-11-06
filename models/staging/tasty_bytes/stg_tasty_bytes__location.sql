with
    source as (select * from {{ source('tasty_bytes', 'location') }}),

    renamed as (
        select
            location_id,
            placekey         as place_key,
            location         as location_name,
            region           as local_region_name,
            city             as city_name,
            iso_country_code as country_iso_code,
            country          as country_name
        from
            source
    )

select * from renamed