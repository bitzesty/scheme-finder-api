FactoryGirl.define do
  factory :scheme_company_size_relationship do
    scheme
    company_size_id { CompanySize.ids.sample }
  end
end
