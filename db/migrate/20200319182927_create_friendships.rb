class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :sender, index: true, foreign_key: { to_table: :users}, null: false
      t.references :receiver, index: true, foreign_key: { to_table: :users}, null: false
      t.boolean :approved
      t.boolean :close_friend

      t.timestamps
    end
  end
end
