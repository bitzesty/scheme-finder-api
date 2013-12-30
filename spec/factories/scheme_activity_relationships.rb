FactoryGirl.define do
  factory :scheme_activity_relationship do
    scheme
    activity_id { Activity.ids.sample }
  end
end
