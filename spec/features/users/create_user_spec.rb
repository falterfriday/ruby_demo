require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit '/'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'email', with: 'kobe2@lakers.com'
    fill_in 'name', with: 'kobe'
    fill_in 'password', with:  'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Submit'
    last_user = User.last
    expect(current_path).to eq("/users/#{last_user.id}")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'Submit'
    expect(current_path).to eq('/')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end
