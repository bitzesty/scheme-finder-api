class SchemeDecorator < ApplicationDecorator
  def location_list
    h.collection_list locations
  end

  def sector_list
    h.collection_list sectors
  end

  def subject_list
    h.collection_list subjects
  end

  def audience_list
    h.collection_list audiences
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

  def require_direct_interactions_icon
    h.confirmation_icon had_direct_interactions?
  end

  def confirmed_icon
    h.confirmation_icon confirmed?
  end

  def contact_email_link
    h.mail_to contact_email
  end

  def website_link
    h.site_link website
  end
end
