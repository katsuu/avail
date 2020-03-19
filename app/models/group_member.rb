class GroupMember < ApplicationRecord
  belongs_to :friend_group
  belongs_to :user

  validates :friend_group, presence: true
  validates :user, presence: true
end
