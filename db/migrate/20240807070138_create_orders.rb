class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.date :delivery_date
      t.time :delivery_time
      t.text :description

      t.timestamps
    end
  end
end
