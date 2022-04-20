class Purchase < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :category_purchases, foreign_key: 'purchase_id', dependent: :destroy
  has_many :categories, through: :category_purchases, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :amount, presence: true, comparison: { greater_than: 0 }
end
