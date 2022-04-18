class AddPurchaseRefToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :purchase, foreign_key: { to_table: :purchases }, index: true
  end
end
