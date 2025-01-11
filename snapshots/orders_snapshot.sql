{% snapshot orders_snapshot_check %}

    {{
        config(
         target_schema='snapshots',
          strategy='check',
          unique_key='id',
          check_cols=['SUBTOTAL', 'ORDER_TOTAL'],
        )
    }}

    select * from {{ source('ecom', 'raw_orders') }}

{% endsnapshot %}