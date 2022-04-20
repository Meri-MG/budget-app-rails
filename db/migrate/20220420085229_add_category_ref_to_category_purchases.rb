class AddCategoryRefToCategoryPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_purchases, :category, null: false, foreign_key: true
  end
end
