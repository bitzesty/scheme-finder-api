class Feedback < ActiveRecord::Base
  belongs_to :scheme

  validates :scheme, presence: true
  validates :score, presence: true
  validates :description, presence: true, obscenity: true

  # scopes for filtering
  scope :approved, -> { where approved: true }
  scope :unapproved, -> { where approved: [false, nil] }
  scope :for_scheme_id, ->(scheme_id) { where scheme_id: scheme_id }
  scope :for_scheme, ->(scheme) { where scheme: scheme }

  # scopes for ordering
  scope :by_latest, -> { order created_at: :desc }

  def approve
    self.approved = true
    save
  end
end
