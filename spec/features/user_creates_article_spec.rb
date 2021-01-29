require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

feature 'Article Creation' do
  before(:all) do
    sign_up
  end
  scenario 'allows user to visit new article page' do
    visit new_article_path

    expect(page).to have_content 'New article'
  end
end

def sign_up
  visit new_user_registration_path

  fill_in :user_email,                  with: 'user@example.com'
  fill_in :user_username,               with: 'mike'
  fill_in :user_password,               with: 'secure123@#'
  fill_in :user_password_confirmation,  with: 'secure123@#'

  click_button 'Sign up'
end
