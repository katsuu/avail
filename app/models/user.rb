class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true
  validates :username, uniqueness: true
  validates :availability, inclusion: { in: [true, false] }

  has_many :hangouts
  has_many :hangout_invitees
  has_many :hangouts
  has_many :friend_groups
  has_many :group_members
  # has_many :friendships

  has_one_attached :avatar
end
