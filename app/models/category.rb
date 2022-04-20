class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :category_purchases, foreign_key: 'category_id', dependent: :destroy
  has_many :purchases, through: :category_purchases, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :icon, presence: true
end
