class AddCategoryArrayToProduct < ActiveRecord::Migration
  def change
    add_column :products, :categories, :string, array: true
  end
end
