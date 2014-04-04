class CompanySize < ActiveHash::Base
  include ExposableViaApi

  self.data = [
    { id: ID_FOR_ALL, name: "All Company sizes" },
    { id: "0-9", name: "0-9" },
    { id: "10-249", name: "10-249" },
    { id: "250-500", name: "250-500" },
    { id: "501-1000", name: "501-1000" },
    { id: "more_than_1000", name: "1000 +" },
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
