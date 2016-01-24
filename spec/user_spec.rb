require 'rails_helper'

describe User do
  it "authenticates with matching email & password" do
    user = FactoryGirl.create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
    expect(user.password).to eq("password")
  end

  it "does not authenticate with incorrect password" do
    user = FactoryGirl.create(:user, email: "fbongiovanni29@gmail.com", password: "password", firstname: "francis", lastname: "Bongiovanni")
    expect(user.password).not_to eq("notpassword")
  end
end

