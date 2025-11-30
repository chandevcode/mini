class MenuItem < ApplicationRecord
  belongs_to :category

 def self.ransackable_attributes(auth_object = nil)
    %w[
      name
      price
      is_available
      created_at
      category_id
    ]
  end

  # Allowlist associations for search (category_name_cont, etc)
  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end
