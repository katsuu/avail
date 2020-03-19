class ChangeFriendshipDefaultApprovedAndCloseFriend < ActiveRecord::Migration[6.0]
  def change
    change_column_default :friendships, :close_friend, false
    change_column :friendships, :approved, :string, default: 'Pending'

  end
end
