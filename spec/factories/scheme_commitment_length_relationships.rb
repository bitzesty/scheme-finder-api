FactoryGirl.define do
  factory :scheme_commitment_length_relationship do
    scheme
    commitment_length_id { CommitmentLength.ids.sample }
  end
end
