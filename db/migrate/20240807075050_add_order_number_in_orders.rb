class AddOrderNumberInOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_number_id, :string
  end
end
