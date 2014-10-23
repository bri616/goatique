class ChangeCardNumberFormatInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :card_number, :string
  end
end
