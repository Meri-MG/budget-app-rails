class Purchase < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  has_many :categories, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :amount, presence: true, comparison: { greater_than: 0 }
end
