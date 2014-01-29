class SchemeSearch < Searchlight::Search
  search_on Scheme.confirmed.by_name

  searches :locations, :sectors, :activities, :age_ranges, :company_sizes

  def locations
    locs = add_id_for_all(super)

    if searching_for_all_of_england?(locs)
      locs += locations_including_whole_england_coverage
    end

    if searching_for_some_england_location?(locs)
      locs << all_of_england_location
    end

    locs.uniq
  end

  def sectors
    add_id_for_all super
  end

  def activities
    add_id_for_all super
  end

  def search_locations
    search.where.overlap(location_ids: locations)
  end

  def search_sectors
    search.where.overlap(sector_ids: sectors)
  end

  def search_activities
    search.where.overlap(activity_ids: activities)
  end

  def search_age_ranges
    search.where.overlap(age_range_ids: age_ranges)
  end

  def search_company_sizes
    search.where.overlap(company_size_ids: company_sizes)
  end

  def add_id_for_all(selected_ids)
    selected_ids = Array.wrap(selected_ids)
    if selected_ids.any?
      (selected_ids << ExposableViaApi::ID_FOR_ALL).uniq
    else
      selected_ids
    end
  end

  def searching_for_all_of_england?(locations)
    locations.include? Location.all_of_england_id
  end

  def locations_including_whole_england_coverage
    Location.for_england.map(&:id)
  end

  def searching_for_some_england_location?(locations)
    (Location.for_england.map(&:id) & locations).any?
  end

  def all_of_england_location
    Location.all_of_england_id
  end
end
