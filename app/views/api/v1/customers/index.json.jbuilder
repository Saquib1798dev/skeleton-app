json.customers @customers do
  json.array!(@customers) do |customer|
    json.id customer.id
    json.name customer.name
    json.email customer.email
    json.number customer.number
    json.address customer.address
    
    # Include orders
    json.orders customer.orders do |order|
      json.id order.id
      json.status order.status
      json.delivery_date order.delivery_date
      json.delivery_time order.delivery_time
      json.order_description order.description
      json.order_number_id order.order_number_id # Fixed here
    end
  end
end
