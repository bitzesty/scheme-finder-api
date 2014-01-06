class Location < ActiveHash::Base
  self.data = [
    { id: "england", name: "All of England", group: "England" },
    { id: "north_east", name: "North East", group: "England" },
    { id: "north_west", name: "North West", group: "England" },
    { id: "yorkshire_humber", name: "Yorkshire and the Humber", group: "England" },
    { id: "east_midlands", name: "East Midlands", group: "England" },
    { id: "west_midlands", name: "West Midlands", group: "England" },
    { id: "east_england", name: "East of England", group: "England" },
    { id: "london", name: "London", group: "England" },
    { id: "south_england", name: "South East", group: "England" },
    { id: "south_west", name: "South West", group: "England" },
    { id: "northern_ireland", name: "All of Northern Ireland", group: "Nothern Ireland" },
    { id: "scotland", name: "All of Scotland", group: "Scotland" },
    { id: "wales", name: "All of Wales", group: "Wales" },
  ]

  def to_s
    name
  end

  def self.collection
    all.group_by(&:group)
  end

  def self.ids
    all.map(&:id)
  end
end
