class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :sender, index: true, foreign_key: { to_table: :users}
      t.references :receiver, index: true, foreign_key: { to_table: :users}
      t.boolean :approved
      t.boolean :close_friend

      t.timestamps
    end
  end
end
