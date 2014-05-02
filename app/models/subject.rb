class Subject < ActiveHash::Base
  include ExposableViaApi

  self.data = [
    { id: "science", name: "Science" },
    { id: "technology", name: "Technology" },
    { id: "engineering", name: "Engineering" },
    { id: "maths", name: "Maths" },
    { id: "english", name: "English" },
    { id: "design", name: "Design" },
    { id: "other", name: "Other" },
    { id: "stem_based", name: "STEM-based" },
    { id: "enterprise", name: "Enterprise" }
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
