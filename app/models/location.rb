class Location < ActiveHash::Base
  self.data = [
    { id: "any", name: "Any Location" },
    { id: "england", name: "All of England" },
    { id: "north_east", name: "North East" },
    { id: "north_west", name: "North West" },
    { id: "yorkshire_humber", name: "Yorkshire and the Humber " },
    { id: "east_midlands", name: "East Midlands" },
    { id: "west_midlands", name: "West Midlands" },
    { id: "east_england", name: "East of England" },
    { id: "london", name: "London" },
    { id: "south_england", name: "South East" },
    { id: "south_west", name: "South West" },
    { id: "northern_ireland", name: "Northern Ireland" },
    { id: "scotland", name: "Scotland" },
    { id: "wales", name: "Wales" },
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
