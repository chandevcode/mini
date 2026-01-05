class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items
  belongs_to :user, optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_type", "status", "table_number", "total_price", "updated_at"]
  end
end
