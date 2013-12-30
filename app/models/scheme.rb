class Scheme < ActiveRecord::Base
  has_many :scheme_location_relationships

  mount_uploader :logo, LogoUploader

  # mimic association has_many :locations, through: :scheme_location_relationships
  def locations
    Location.find location_ids
  end

  def location_ids
    scheme_location_relationships.map(&:location_id)
  end
end
