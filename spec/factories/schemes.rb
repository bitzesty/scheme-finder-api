FactoryGirl.define do
  sequence :name do |n|
    "Scheme #{n}"
  end

  sequence :contact_email do |n|
    "person#{n}@example.com"
  end

  factory :scheme do
    contact_name "Jim Bim"
    contact_email
    contact_phone "0771233445"
    name
    website "example.com"
    description "Host a short visit"
    had_direct_interactions { [false, true].sample }
    location_ids { [Location.exposable_via_api.sample] }
    sector_ids { [Sector.exposable_via_api.sample] }
    commitment_length_ids { [CommitmentLength.ids.sample] }
    activity_ids { [Activity.exposable_via_api.sample] }
    company_size_ids { [CompanySize.ids.sample] }
    age_range_ids { [AgeRange.ids.sample] }

    trait :confirmed do
      confirmed { true }
    end

    trait :unconfirmed do
      confirmed { false }
    end
  end
end
