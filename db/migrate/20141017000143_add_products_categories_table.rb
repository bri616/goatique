class AddProductsCategoriesTable < ActiveRecord::Migration
  def change
    create_table :products_categories, id: false do |t|
      t.belongs_to :assembly
      t.belongs_to :part
    end
  end
end

# http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
