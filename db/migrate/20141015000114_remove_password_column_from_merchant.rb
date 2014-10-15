class RemovePasswordColumnFromMerchant < ActiveRecord::Migration
  def change
    remove_column(:merchants, :password_string)
  end
end
