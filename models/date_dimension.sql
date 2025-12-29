WITH CTE AS(
SELECT
to_timestamp(STARTED_AT) as STARTED_AT,
DATE(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
HOUR(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,

{{day_type('STARTED_AT')}} as DAY_TYPE,

{{get_season('STARTED_AT')}} AS STATION_OF_YEAR


 
from {{ ref('stg_bike') }}
where STARTED_AT != 'started_at'
)

SELECT
* 
FROM CTE