version: 2

models:
    - name: stg_customers
      description: Staged customer data from hte Jaffle Shop app.
      columns: 
        - name: customer_id
          description: This is the primary key on the table.
          tests: 
            - unique
            - not_null

    - name: stg_orders
      description: Staged order data from the Jaffle Shop app.
      columns:
        - name: order_id
          description: Primary key on the table.
          tests:
            - unique
            - not null
        - name: status
          description: "{{doc('order_status')}}"
          tests: 
            - accepted_values:
                values:
                  - completed
                  - shipped 
                  - returned
                  - placed
                  - return_pending
