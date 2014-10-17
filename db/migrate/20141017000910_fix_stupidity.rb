class FixStupidity < ActiveRecord::Migration
  def change
    rename_column :products_categories, :assembly_id, :product_id
    rename_column :products_categories, :part_id, :category_id
  end
end
