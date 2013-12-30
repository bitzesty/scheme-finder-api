FactoryGirl.define do
  factory :scheme do
    had_direct_interactions { [false, true].sample }
  end
end
