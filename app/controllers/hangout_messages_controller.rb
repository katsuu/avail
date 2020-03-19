class HangoutMessagesController < ApplicationController
  before_action :find_hangout_message, only: [:edit, :update, :destroy]

  def create
    @hangout_chat = HangoutChat.find(params[:hangout_chat_id])
    @hangout_message = HangoutMessage.new(hangout_message_params)
    @hangout_message.hangout_chat = @hangout_chat
    @hangout_message.user = current_user
    if @hangout_message.save
      redirect_to hangout_chat_path(@hangout_chat)
    else
      # render? OR 👇
      # redirect_to hangout_chat_path(@hangout_chat)
      # raise error message
    end
  end

  def edit; end

  def update
    @hangout_message.update(hangout_message_params)
    redirect_to hangout_chat_path(@hangout_message.hangout_chat)
  end

  def destroy
    @hangout_message.delete
    redirect_to hangout_chat_path(@hangout_message.hangout_chat)
  end

  private

  def hangout_message_params
    params.require(:hangout_message).permit(:content)
  end

  def find_hangout_message
    @hangout_message = HangoutMessage.find(params[:id])
  end
end
