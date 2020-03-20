class CreateHangoutMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :hangout_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hangout_chat, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
