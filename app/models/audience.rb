class Audience < ActiveHash::Base
  include ExposableViaApi

  self.data = [
    { id: ID_FOR_ALL, name: "All Audiences" },
    { id: "businesses", name: "Businesses" },
    { id: "teachers", name: "Teachers" },
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
