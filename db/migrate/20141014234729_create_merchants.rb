class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :email
      t.string :user_name
      t.string :password_string
      t.string :password_confirmation
      t.string :shop_name
      t.text :description

      t.timestamps
    end
  end
end
