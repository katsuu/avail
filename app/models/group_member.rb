class GroupMember < ApplicationRecord
  belongs_to :friend_group
  belongs_to :user
end
