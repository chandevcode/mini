class Order < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_type", "status", "table_number", "total_price", "updated_at"]
  end
end
