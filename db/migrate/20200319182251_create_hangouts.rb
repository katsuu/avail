class CreateHangouts < ActiveRecord::Migration[6.0]
  def change
    create_table :hangouts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :category
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.references :hangout_chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
