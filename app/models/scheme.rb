class Scheme < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  validates :location_ids, presence: true
  validates :sector_ids, presence: true
  validates :activity_ids, presence: true
  validates :age_range_ids, presence: true
  validates :commitment_length_ids, presence: true
  validates :company_size_ids, presence: true

  def locations
    Location.find(location_ids)
  end

  def sectors
    Sector.find(sector_ids)
  end

  def activities
    Activity.find(activity_ids)
  end

  def age_ranges
    AgeRange.find(age_range_ids)
  end

  def commitment_lengths
    CommitmentLength.find(commitment_length_ids)
  end

  def company_sizes
    CompanySize.find(company_size_ids)
  end

  def location_ids=(location_ids)
    super(Array(location_ids).reject(&:blank?))
  end

  def sector_ids=(sector_ids)
    super(Array(sector_ids).reject(&:blank?))
  end

  def activity_ids=(activity_ids)
    super(Array(activity_ids).reject(&:blank?))
  end

  def age_range_ids=(age_range_ids)
    super(Array(age_range_ids).reject(&:blank?))
  end

  def commitment_length_ids=(commitment_length_ids)
    super(Array(commitment_length_ids).reject(&:blank?))
  end

  def company_size_ids=(company_size_ids)
    super(Array(company_size_ids).reject(&:blank?))
  end
end
