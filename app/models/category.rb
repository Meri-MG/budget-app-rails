class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses
  before_destroy do
    expenses.each { |expense| expense.destroy }
  end

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :icon, presence: true
end
