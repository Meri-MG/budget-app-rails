require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'Categories', type: :system do
  describe 'Index and show Pages' do
    let!(:user) do
      visit new_user_session_path
      user = User.create(
        name: 'Meri',
        id: 1,
        email: 'meri2@example.com',
        password: 'password',
        confirmed_at: Time.now
      )
      Category.create(
        user: user,
        name: 'sports',
        icon: 'some icon'
      )
      fill_in 'user_email', with: 'meri2@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit authenticated_root_path
      user
    end

    it 'should check the content of category attributes on the page' do
      expect(page).to have_content('SPORTS')
      expect(page).to have_content('some icon')
    end

    it 'add category' do
      category = Category.create(
        user: user,
        name: 'sports',
        icon: 'some icon'
      )
      click_link 'Add Category'

      fill_in 'category_name', with: 'plants'
      fill_in 'category_icon', with: 'icon'

      click_button 'Save'

      expect(page).to have_current_path("/categories/#{category.id + 1}")
      expect(page).to have_content('Category was successfully created.')
      expect(page).to have_content('TOTAL TRANSACTIONS')
      expect(page).to have_content('$0')
    end

    it 'add transaction' do
      click_link 'Add Category'

      fill_in 'category_name', with: 'plants'
      fill_in 'category_icon', with: 'icon'

      click_button 'Save'
      click_link 'Add new transaction'

      fill_in 'expense_name', with: 'flower'
      fill_in 'expense_amount', with: 7
      find(:css, '#expense_categories_ids').find(:option, 'plants').select_option

      click_button 'Save'
    end
  end
end

# rubocop:enable Metrics/BlockLength
