require 'rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "Signs in" do
    visit 'users/new'
      within("#signin") do
	fill_in 'Email', :with => "email"
	fill_in 'Password', :with => "password"
      end
      click_button 'Login'
      expect(current_path).to eq('/') 
  end
end
