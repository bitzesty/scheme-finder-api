class SchemeSearch < Searchlight::Search
  search_on Scheme

  searches :locations, :sectors, :activities, :age_ranges,
           :commitment_lengths, :company_sizes

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
end
