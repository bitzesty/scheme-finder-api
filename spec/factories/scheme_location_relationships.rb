FactoryGirl.define do
  factory :scheme_location_relationship do
    scheme
    location_id { Location.ids.sample }
  end
end
