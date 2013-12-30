FactoryGirl.define do
  factory :scheme_age_range_relationship do
    scheme
    age_range_id { AgeRange.ids.sample }
  end
end
