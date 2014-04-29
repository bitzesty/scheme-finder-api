class Sector < ActiveHash::Base
  include ExposableViaApi

  self.data = [
    { id: ID_FOR_ALL, name: "All Sectors" },
    { id: "auto", name: "Auto" },
    { id: "aero", name: "Aero" },
    { id: "chemicals", name: "Chemicals" },
    { id: "construction", name: "Construction" },
    { id: "electronics", name: "Electronics" },
    { id: "technology", name: "Technology" },
    { id: "life_sciences", name: "Life Sciences" },
    { id: "machinery", name: "Machinery" },
    { id: "marine", name: "Marine" },
    { id: "materials", name: "Materials" },
    { id: "nuclear", name: "Nuclear" },
    { id: "oil_gas", name: "Oil and gas" },
    { id: "business_services", name: "Professional Business Services" },
    { id: "rail", name: "Rail" },
    { id: "renewable_energy", name: "Renewable Energy" },
    { id: "other", name: "Other" },
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
