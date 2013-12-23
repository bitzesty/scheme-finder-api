# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scheme do
    had_direct_interactions false
    employees_number_range_id "MyString"
  end
end
