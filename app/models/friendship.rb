class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  validates :approved, inclusion: { in: ['Pending', 'Approved', 'Declined'] }
  validates :close_friend, inclusion: { in: [true, false] }
end
