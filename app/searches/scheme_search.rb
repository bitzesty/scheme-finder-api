class SchemeSearch < Searchlight::Search
  search_on Scheme

  searches :locations

  def search_locations
    search.where.overlap(location_ids: locations)
  end
end
