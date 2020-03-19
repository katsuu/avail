class HangoutChat < ApplicationRecord
  belongs_to :hangout
  has_many :hangout_messages
end
