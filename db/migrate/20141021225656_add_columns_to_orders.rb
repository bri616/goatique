class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :mailing_address, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :card_number, :integer
    add_column :orders, :expiration_date, :date

  end
end
