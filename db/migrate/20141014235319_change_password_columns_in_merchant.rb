class ChangePasswordColumnsInMerchant < ActiveRecord::Migration
  def change
    #remove_column(:merchants, :password)
    remove_column(:merchants, :password_confirmation)
    add_column(:merchants, :password_digest, :string)
  end
end
