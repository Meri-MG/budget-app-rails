class AddUserRefToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :author, foreign_key: { to_table: :users }, index: true
  end
end
