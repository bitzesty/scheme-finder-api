class Feedback < ActiveRecord::Base
  belongs_to :scheme

  validates :scheme, presence: true
  validates :score, presence: true
  validates :description, presence: true

  # scopes for filtering
  scope :approved, -> { where approved: true }
  scope :unapproved, -> { where approved: [false, nil] }
  scope :for_scheme_id, ->(scheme_id) { where scheme_id: scheme_id }

  # scopes for ordering
  scope :by_latest, -> { order created_at: :desc }
end
