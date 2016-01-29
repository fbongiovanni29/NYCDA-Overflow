require 'rails_helper'

feature "User types wrong password" do
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


feature "User types empty password" do
  background do
   create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Sign in with empty password" do
    visit new_user_path 
      within("#signin") do
	fill_in 'email', :with => 'fbongiovanni29@gmail.com' 
	fill_in 'password', :with => ''
      end
      click_button 'Login'
      expect(current_path).to eq('/users/new')
      expect(page).to have_css('form#signin')
  end
end

feature "User types wrong username" do
  background do
   create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_path 
      within("#signin") do
	fill_in 'email', :with => 'wrong@gmail.com' 
	fill_in 'password', :with => 'notpassword'
      end
      click_button 'Login'
      expect(current_path).to eq('/users/new')
      expect(page).to have_css('form#signin')
  end
end

feature "User types empty username" do
  background do
   create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_path 
      within("#signin") do
	fill_in 'email', :with => '' 
	fill_in 'password', :with => 'notpassword'
      end
      click_button 'Login'
      expect(current_path).to eq('/users/new')
      expect(page).to have_css('form#signin')
  end
end


feature "User types empty username & password" do
  background do
   create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
  end

  scenario "Signing in with correct credentials" do
    visit new_user_path 
      within("#signin") do
	fill_in 'email', :with => '' 
	fill_in 'password', :with => ''
      end
      click_button 'Login'
      expect(current_path).to eq('/users/new')
      expect(page).to have_css('form#signin')
  end
end

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

