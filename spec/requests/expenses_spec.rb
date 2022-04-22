require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'expenses' do
    it 'GET /expenses' do
      get expenses_path
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end

    it 'GET /expenses/:id' do
      user = User.create!(name: 'Barbare', email: 'barbare@test.come', password: 'karate', confirmed_at: Time.now)
      expense = user.expenses.create!(name: 'ball', amount: 3)
      sign_in user
      get("/expenses/#{expense.id}")
      expect(response).to render_template('show')
      expect(response).to have_http_status(:ok)
    end

    it 'DELETE /expenses/:id' do
      user = User.create!(name: 'Barbare', email: 'barbare@test.come', password: 'karate', confirmed_at: Time.now)
      expense = user.expenses.create!(name: 'ball', amount: 3)
      sign_in user
      delete("/expenses/#{expense.id}")
      expect do
        get("/expenses/#{expense.id}")
      end.to raise_error(ActiveRecord::RecordNotFound)
      expect(response).to_not render_template('show')
      expect(response).to_not have_http_status(:ok)
    end
  end
end
