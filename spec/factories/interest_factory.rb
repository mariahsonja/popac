FactoryGirl.define do
  factory :interest do
    trait :child do
      name "Child"
    end
    
    trait :refugee do
      name "Refugee"
    end
  end
end