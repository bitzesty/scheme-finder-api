class SchemeSearch < Searchlight::Search
  search_on Scheme

  searches :locations

  def search_locations
    search.where(
      id: SchemeLocationRelationship.where(location_id: locations).pluck(:scheme_id)
    )
  end
end
