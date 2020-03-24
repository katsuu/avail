class HangoutsController < ApplicationController
  before_action :find_hangout, only: [:show, :edit, :update, :destroy]

  def index
    @hangouts = current_user.hangouts.geocoded # SHOULD BE HANGOUTS CREATED AND INVITED TO
    @markers = @hangouts.map do |hangout|
      {
        lat: hangout.latitude,
        lng: hangout.longitude,
      }
    end
  end

  def show; end

  def new
    @hangout = Hangout.new
  end

  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.user = current_user
    if @hangout.save
      @hangout_chat = HangoutChat.new #(hangout_chat_params) WHEN CREATED
      @hangout_chat.save
      @hangout.hangout_chat = @hangout_chat
      if @hangout.save

        redirect_to hangouts_path
      end
    else
      render 'hangouts/new'
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
      :category,
      :address,
      :name
      )
  end

  def find_hangout
    @hangout = Hangout.find(params[:id])
  end
end
