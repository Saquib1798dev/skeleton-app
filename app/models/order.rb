class Order < ApplicationRecord
  # Associations
  belongs_to :customer

  # Enums
  enum status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3, cancelled: 4 }

  # Validations
  validates :status, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time, presence: true
end