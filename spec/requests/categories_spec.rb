require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "categories" do
    it "GET /categories" do
      get categories_path
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end

    it 'GET /categories/:id' do
      user = User.create!(name: 'Barbare', email: 'barbare@test.come', password: 'karate', confirmed_at: Time.now)
      category = user.categories.create!(name: 'Sports', icon: 'icon')
      sign_in user
      get("/categories/#{category.id}")
      expect(response).to render_template('show')
      expect(response).to have_http_status(:ok)
    end

    it 'GET /categories/new' do
      get('/categories/new')
      expect(response).to render_template('new')
      expect(response).to have_http_status(:ok)
    end

    it 'DELETE /foods/:id' do
      user = User.create!(name: 'Barbare', email: 'barbare@test.come', password: 'karate', confirmed_at: Time.now)
      category = user.categories.create!(name: 'Sports', icon: 'icon')
      sign_in user
      delete("/categories/#{category.id}")
      expect do
        get("/categories/#{category.id}")
      end.to raise_error(ActiveRecord::RecordNotFound)
      expect(response).to_not render_template('show')
      expect(response).to_not have_http_status(:ok)
    end
  end

end
