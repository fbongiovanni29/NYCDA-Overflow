require 'rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "Signs in" do
      visit 'users/new'
	within("#signin") do
	puts "in sign in form"
      end
   end
end
