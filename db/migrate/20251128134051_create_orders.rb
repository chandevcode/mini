class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :order_type
      t.integer :table_number
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
