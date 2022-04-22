require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'expenses', type: :system do
  describe 'Show Page' do
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

    it 'add transaction' do
      expense = Expense.create(name: 'flower', amount: 7, user: user)
      click_link 'Add Category'

      fill_in 'category_name', with: 'plants'
      fill_in 'category_icon', with: 'icon'

      click_button 'Save'
      click_link 'Add new transaction'

      fill_in 'expense_name', with: expense.name
      fill_in 'expense_amount', with: expense.amount
      find(:css, '#expense_categories_ids').find(:option, 'plants').select_option

      click_button 'Save'

      expect(page).to have_current_path("/expenses/#{expense.id + 1}")
      expect(page).to have_content('Transaction was successfully created.')
      expect(page).to have_content('FLOWER')
      expect(page).to have_content('PLANTS')
      expect(page).to have_content('$ 7')
      expect(page).to have_button('Delete')
    end
  end
end

# rubocop:enable Metrics/BlockLength
