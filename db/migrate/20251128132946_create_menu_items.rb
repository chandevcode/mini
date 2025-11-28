class CreateMenuItems < ActiveRecord::Migration[8.1]
  def change
    create_table :menu_items do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price
      t.boolean :is_available

      t.timestamps
    end
  end
end
