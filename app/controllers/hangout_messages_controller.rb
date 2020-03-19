class HangoutMessagesController < ApplicationController
  def create

  end

  def edit

  end

  def destroy

  end

  private

  def hangout_message_params
    params.require(:hangout_message).permit(:content)
  end
end
