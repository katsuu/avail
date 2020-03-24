class Hangout < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_one :hangout_chat
  has_many :hangout_invitees

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ['Any', 'Productive', 'Explore', 'Learn', 'Fun', 'Other'] }

end
