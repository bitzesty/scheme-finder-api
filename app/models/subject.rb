class Subject < ActiveHash::Base
  include ExposableViaApi

  self.data = [
    { id: "design", name: "Design and technology" },
    { id: "engineering", name: "Engineering" },
    { id: "english", name: "English" },
    { id: "enterprise", name: "Enterprise" },
    { id: "information_technology", name: "Information Technology" },
    { id: "literacy", name: "Literacy" },
    { id: "maths", name: "Maths" },
    { id: "other", name: "Other" },
    { id: "stem_based", name: "STEM - based" },
    { id: "science", name: "Science" },
    { id: "technology", name: "Technology" }
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
