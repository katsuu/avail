class HangoutsController < ApplicationController
  before_action :find_hangout, only: [:show, :edit, :update, :destroy]

  def index
    @hangouts = User.hangouts # SHOULD BE HANGOUTS CREATED AND INVITED TO
  end

  def show; end

  def new
    @hangout = Hangout.new
  end

  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.user = current_user
    @hangout_chat = HangoutChat.new #(hangout_chat_params) WHEN CREATED
    @hangout.hangout_chat = @hangout_chat
    if @hangout.save
      # redirect_to TBD ROUTING...
    else
      # TBD ...
    end
  end

  def edit; end

  def update
    @hangout.update(hangout_params)
    redirect_to hangout_path(@hangout)
  end

  def destroy
    @hangout.delete
    # redirect_to TBD ROUTING...
  end

  private

  def hangout_params
    params.require(:hangout).permit(
      :start_time,
      :end_time,
      :date,
      :category,
      :address
      )
  end

  def find_hangout
    @hangout = Hangout.find(params[:id])
  end
end
