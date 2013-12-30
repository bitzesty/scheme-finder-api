class SchemeDecorator < ApplicationDecorator
  def location_list
    h.collection_list locations
  end

  def sector_list
    h.collection_list sectors
  end

  def activity_list
    h.collection_list activities
  end

  def company_size_list
    h.collection_list company_sizes
  end

  def age_range_list
    h.collection_list age_ranges
  end

  def commitment_length_list
    h.collection_list commitment_lengths
  end

  def require_direct_interactions_icon
    h.confirmation_icon had_direct_interactions?
  end
end
