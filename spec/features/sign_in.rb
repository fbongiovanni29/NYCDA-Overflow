require 'rails_helper'

feature "Successul sign in" do
  background do
   create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_path 
      within("#signin") do
	fill_in 'email', :with => 'fbongiovanni29@gmail.com' 
	fill_in 'password', :with => 'password'
      end
      click_button 'Login'
      expect(current_path).to eq('/')
      expect(page).to have_link('Logout') 
  end
end

feature "Unsuccessul sign in" do
  background do
   create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_path 
      within("#signin") do
	fill_in 'email', :with => 'fbongiovanni29@gmail.com' 
	fill_in 'password', :with => 'notpassword'
      end
      click_button 'Login'
      expect(current_path).to eq('/users/new')
      expect(page).to have_css('form#signin')
  end
end
