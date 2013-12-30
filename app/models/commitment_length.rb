class CommitmentLength < ActiveHash::Base
  self.data = [
    { id: "few_hours", name: "A few hours" },
    { id: "longer_term", name: "A longer term commitment" },
  ]

  def to_s
    name
  end

  def self.collection
    all
  end

  def self.ids
    all.map(&:id)
  end
end
