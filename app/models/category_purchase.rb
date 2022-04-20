class CategoryPurchase < ApplicationRecord
  belongs_to :category, foreign_key: 'category_id'
  belongs_to :purchase, foreign_key: 'purchase_id'
end
