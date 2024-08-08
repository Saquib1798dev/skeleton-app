class Customer < ApplicationRecord
  # Associations
  has_many :orders, dependent: :destroy
  has_many :transcripts, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :number, presence: true

  def self.search(query)
    if query.present?
      left_joins(:orders).where(
        'customers.name ILIKE ? OR customers.email ILIKE ? OR customers.number ILIKE ? OR orders.order_number_id::text ILIKE ?',
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
      ).distinct
    else
      all
    end
  end
end