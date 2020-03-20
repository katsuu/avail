class Hangout < ApplicationRecord
  belongs_to :user
  has_one :hangout_chat
  has_many :hangout_invitees

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
  validates :category, presence: true, inclusion: { in: ['Any', 'Productive', 'Explore', 'Learn', 'Fun', 'Other'] }

end
