class User < ApplicationRecord
  has_many: categories, foreign_key: 'author_id', class_name: 'User', dependent: :destroy
  has_many: purchases, foreign_key: 'author_id', class_name: 'User', dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
