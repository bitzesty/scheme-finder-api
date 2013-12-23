FactoryGirl.define do
  sequence(:user_email) { |n| "user#{n}@example.com" }

  factory :user do
    email    { generate(:user_email) }
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  factory :admin, parent: :user do
    admin { true }
  end
end
