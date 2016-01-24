FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "fbongiovanni#{n}@gmail.com" }
    password "password"
    firstname "Francis"
    lastname "Bongiovanni"
  end
end
