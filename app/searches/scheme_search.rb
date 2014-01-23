class SchemeSearch < Searchlight::Search
  search_on Scheme.confirmed.by_name

  searches :locations, :sectors, :activities, :age_ranges,
           :commitment_lengths, :company_sizes

  def locations
    locs = add_id_for_all(super)

    if locs.include? Location.all_of_england_id
      locations_including_whole_england_coverage(locs)
    else
      locs
    end
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

  def search_commitment_lengths
    search.where.overlap(commitment_length_ids: commitment_lengths)
  end

  def search_company_sizes
    search.where.overlap(company_size_ids: company_sizes)
  end

  private
  def locations_including_whole_england_coverage(locations)
    (locations + Location.for_england.map(&:id)).uniq
  end

  def add_id_for_all(selected_ids)
    selected_ids = Array.wrap(selected_ids)
    if selected_ids.any?
      (selected_ids << ExposableViaApi::ID_FOR_ALL).uniq
    else
      selected_ids
    end
  end
end
