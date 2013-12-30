FactoryGirl.define do
  factory :scheme do
    had_direct_interactions { [false, true].sample }
    location_ids { Location.ids.sample }
    sector_ids { Sector.ids.sample }
    commitment_length_ids { CommitmentLength.ids.sample }
    activity_ids { Activity.ids.sample }
    company_size_ids { CompanySize.ids.sample }
    age_range_ids { AgeRange.ids.sample }
  end
end
