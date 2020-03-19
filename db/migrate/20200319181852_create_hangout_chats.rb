class CreateHangoutChats < ActiveRecord::Migration[6.0]
  def change
    create_table :hangout_chats do |t|

      t.timestamps
    end
  end
end
