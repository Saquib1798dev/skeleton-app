
 # Order details and the Customer
json.order_id @order.id
json.order_status @order.status
json.delivery_date @order.delivery_date
json.delivery_time @order.delivery_time
json.order_description @order.description
json.order_number_id @order.order_number_id # Fixed here
json.customer_id @customer.id
json.customer_name @customer.name
json.customer_email @customer.email
json.customer_number @customer.number
json.customer_address @customer.address
