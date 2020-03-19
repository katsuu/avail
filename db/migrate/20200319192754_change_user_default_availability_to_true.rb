class ChangeUserDefaultAvailabilityToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :availability, true
  end
end
