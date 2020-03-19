class Hangout < ApplicationRecord
  belongs_to :user
  belongs_to :hangout_chat
end
