class HangoutChatsController < ApplicationController
  def show
    @hangout_chat = HangoutChat.find(params[:hangout_chat_id]) # TAKEN FROM HANGOUT SHOW?
  end
end
