class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', dependent: :destroy
  has_many :purchases, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
