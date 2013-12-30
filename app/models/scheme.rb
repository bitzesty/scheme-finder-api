class Scheme < ActiveRecord::Base
  has_many :scheme_location_relationships
  has_many :scheme_sector_relationships
  has_many :scheme_activity_relationships
  has_many :scheme_age_range_relationships
  has_many :scheme_commitment_length_relationships
  has_many :scheme_company_size_relationships

  mount_uploader :logo, LogoUploader

  # validates :scheme_location_relationships, presence: true
  # validates :scheme_sector_relationships, presence: true
  # validates :scheme_activity_relationships, presence: true
  # validates :scheme_age_range_relationships, presence: true
  # validates :scheme_commitment_length_relationships, presence: true
  # validates :scheme_company_size_relationships, presence: true

  ## Active Hash associations
  # has_many :locations, through: :scheme_location_relationships
  def locations
    Location.find location_ids
  end

  def location_ids
    scheme_location_relationships.map(&:location_id)
  end

  # has_many :sectors, through: :scheme_sector_relationships
  def sectors
    Location.find sector_ids
  end

  def sector_ids
    scheme_sector_relationships.map(&:sector_id)
  end

  # has_many :activities, through: :scheme_activity_relationships
  def activities
    Location.find activity_ids
  end

  def activity_ids
    scheme_activity_relationships.map(&:activity_id)
  end

  # has_many :age_ranges, through: :scheme_age_range_relationships
  def age_ranges
    Location.find age_range_ids
  end

  def age_range_ids
    scheme_age_range_relationships.map(&:age_range_id)
  end

  # has_many :commitment_lengths, through: :scheme_commitment_length_relationships
  def commitment_lengths
    Location.find commitment_length_ids
  end

  def commitment_length_ids
    scheme_commitment_length_relationships.map(&:commitment_length_id)
  end

  # has_many :company_sizes, through: :scheme_company_size_relationships
  def company_sizes
    Location.find company_size_ids
  end

  def company_size_ids
    scheme_company_size_relationships.map(&:company_size_id)
  end
  ##END Active Hash associations
end
