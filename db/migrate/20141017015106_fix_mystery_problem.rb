class FixMysteryProblem < ActiveRecord::Migration
  def change
    rename_table :products_categories, :categories_products
    # these have to be alphabetical! crazypants!
  end
end
