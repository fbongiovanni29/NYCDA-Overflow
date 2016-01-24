require 'rails_helper'

RSpec.feature "Signing in" do
  background do
    FactoryGirl.create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit root_path 
      within("#signin") do
	puts User.find(1).email;
	fill_in 'email', :with => 'fbongiovanni29@gmail.com' 
	fill_in 'password', :with => 'password'
      end
      click_button 'Login'
      expect(current_path).to eq('/') 
  end
end
