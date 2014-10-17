class RemoveCategoryArrayColumnFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :categories
  end
end
