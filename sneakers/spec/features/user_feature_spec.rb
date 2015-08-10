# Write a feature test to verify that when the user signs into the site they are redirected to their own user_path.

# Write a feature test to verify that when the user creates a new pair of shoes, they are redirected to their user_path, and that they see the shoes listed in the table. This test will fail. Make it pass without using an instance variable for @shoes.

# Write tests for the username length validations that already exist on the User model.

require 'pry'
require 'rails_helper'

describe User do

  let(:user){create(:user)}

  before do
      visit login_path
      # save_and_open_page
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Sign In'
  end

  context 'sign in' do

    scenario 'success redirects to own user path' do
      expect(current_url).to eq(user_url(user.id))
    end

  end

  context 'create new pair of shoes' do

    scenario 'success redirects to own user path' do
      visit new_user_shoe_path(user)
      fill_in 'shoe_brand', with: 'Adidas'
      fill_in 'shoe_model', with: 'DR3'
      select '1995', from: 'shoe_year'
      select '2015', from: 'shoe_purchase_date_1i'
      select 'May', from: 'shoe_purchase_date_2i'
      select '10', from: 'shoe_purchase_date_3i'
      click_button 'Create Shoe'
      expect(current_url).to eq(user_url(user.id))
      expect(page).to have_content("shoe closet")
    end

  end

end