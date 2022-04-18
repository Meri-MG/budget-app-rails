class AddCategoryRefToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :category, foreign_key: { to_table: :categories }, index: true
  end
end
