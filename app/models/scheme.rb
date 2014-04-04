class Scheme < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  has_many :feedbacks, dependent: :destroy

  validates :contact_name, presence: true
  validates :contact_phone, presence: true
  validates :contact_email, presence: true # , email: true not validating email
  validates :name, presence: true
  validates :website, presence: true

  # scopes for filtering
  scope :confirmed, -> { where confirmed: true }
  scope :unconfirmed, -> { where confirmed: [false, nil] }

  # scopes for ordering
  scope :by_name, -> { order name: :asc }

  def to_s
    name
  end

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

  def company_sizes
    CompanySize.find(company_size_ids)
  end

  def audiences
    Audience.find(audience_ids)
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

  def company_size_ids=(company_size_ids)
    super(Array(company_size_ids).reject(&:blank?))
  end

  def audience_ids=(audience_ids)
    super(Array(audience_ids).reject(&:blank?))
  end

  def persist
    begin
      save
    rescue ActiveRecord::RecordNotUnique
      errors.add(:name, 'is already taken')

      false
    end
  end
end
