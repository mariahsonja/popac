FactoryGirl.define do
  factory :user do
    password SecureRandom.hex
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end