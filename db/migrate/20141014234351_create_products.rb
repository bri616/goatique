class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :merchant_id
      t.string :name
      t.integer :price
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
