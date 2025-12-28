WITH trips as (

select 
ride_id,
--rideable_type,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
start_station_id,
END_STATION_ID,
MEMBER_CASUAL,
TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION


from {{ ref('stg_bike') }}

where ride_id != 'ride_id'

limit 10
)

select * from trips