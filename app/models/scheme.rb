class Scheme < ActiveRecord::Base
  has_many :scheme_location_relationships
  has_many :scheme_sector_relationships

  mount_uploader :logo, LogoUploader

  # mimic association has_many :locations, through: :scheme_location_relationships
  def locations
    Location.find location_ids
  end

  def location_ids
    scheme_location_relationships.map(&:location_id)
  end

  # mimic association has_many :sectors, through: :scheme_sector_relationships
  def sectors
    Location.find sector_ids
  end

  def sector_ids
    scheme_sector_relationships.map(&:sector_id)
  end
end
