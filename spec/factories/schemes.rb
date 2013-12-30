FactoryGirl.define do
  factory :scheme do
    had_direct_interactions { [false, true].sample }
    location_ids { Location.ids.sample }
    sector_ids { Sector.ids.sample }
    commitment_length_ids { CommitmentLength.ids.sample }
    activity_ids { Activity.ids.sample }
    company_size_ids { CompanySize.ids.sample }
    age_range_ids { AgeRange.ids.sample }

    trait :with_location do
      after(:create) { |scheme, evaluator|
        create(:scheme_location_relationship, scheme: scheme)
      }
    end
  end
end
