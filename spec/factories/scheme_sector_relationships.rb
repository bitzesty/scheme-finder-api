FactoryGirl.define do
  factory :scheme_sector_relationship do
    scheme
    sector_id { Sector.ids.sample }
  end
end
