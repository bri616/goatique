class ChangeCardNumberFormatInOrder < ActiveRecord::Migration
  def change
    change_column :orders, :expiration_date, :string
  end
end
