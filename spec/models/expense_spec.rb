require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    user = User.create(name: 'Barbare', email: 'barbare@test.come', password: 'karate')
    Expense.new(user: user, name: 'jumping rope', amount: 23)
  end

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:categories) }
  end

  describe 'validations' do
    it 'isn\'t valid without name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid with name less than 3 characters' do
      subject.name = 'ha'
      expect(subject).to_not be_valid
    end

    it 'isn\'t valid if amount isnt greater than zero' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end

    it 'the amount to be an integer' do
      expect(subject.amount).to be_integer
    end
  end
end
