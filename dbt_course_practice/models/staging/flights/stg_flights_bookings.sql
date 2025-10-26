{{
      config(
      materialized = 'materialized_view',
      on_configuration_change="apply",
      indexes=[
        {
            "columns": ["book_date"],
            "unique":  false
        }
    ]
      )
}}

select
    book_ref,
    book_date,
    total_amount,
    total_amount * 2 as full_amount
from
    {{source('demo_src', 'bookings') }}