FactoryGirl.define do
  sequence(:user_email) { |n| "user#{n}@example.com" }

  factory :user do
    email    { generate(:user_email) }
    password { 'As12Df34_!' }
    password_confirmation { 'As12Df34_!' }
  end

  factory :admin, parent: :user do
    admin { true }
  end
end
