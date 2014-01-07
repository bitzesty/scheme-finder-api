FactoryGirl.define do
  factory :feedback do
    scheme
    score 1
    description "This is good scheme"

    trait :approved do
      approved true
    end

    trait :unapproved do
      approved false
    end
  end
end
