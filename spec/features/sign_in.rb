require 'rails_helper'

RSpec.feature "Signing in" do
  background do
    FactoryGirl.create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_path 
    expect(current_path).to eq('/users/new')
      within("#signin") do
	fill_in 'email', :with => 'fbongiovanni29@gmail.com' 
	fill_in 'password', :with => 'password'
      end
      click_button 'Login'
      expect(current_path).to eq('/')
      expect(page).to have_css('ul.nav')
  end
end
