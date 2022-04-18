class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :purchases, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :icon, presence: true
end
