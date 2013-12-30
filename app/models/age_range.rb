class AgeRange < ActiveHash::Base
  self.data = [
    { id: "primary_school_children", name: "Primary school children" },
    { id: "secondary_school_children", name: "Secondary school children" },
    { id: "over_18", name: "18+" },
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
