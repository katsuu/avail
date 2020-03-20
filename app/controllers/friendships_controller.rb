class FriendshipsController < ApplicationController
  before_action :find_friendship, only: [:edit, :update, :destroy]

  # Can user has_many friendships? We have receiver and sender ids connected to user
  # def index
  #   @friendships = current_user.friendships
  # end

  def new
    @friendship = Friendship.new
  end

  def create
    @receiver = User.find_by_username([params[:username]) # MUST WORK IN A WAY TO SEARCH VIA USERNAME
    @friendship = Friendship.new(sender_id: current_user.id, receiver: @receiver.id)
  end

  def edit
    # WAY TO ADJUST CLOSE FRIEND OR NOT
  end

  def update
    # WAY TO ADJUST CLOSE FRIEND OR NOT
  end

  def destroy
    @friendship.delete
    # redirect_to TBD ROUTING...
  end

  private

  def find_friendship
    @friendship = Friendship.find() # BY ID OR SENDER/RECEIVER USER?
  end
end
