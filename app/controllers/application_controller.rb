class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def user_location
    @user_location = Geocoder.search(request.remote_ip).first.coordinates
    if @user_location.empty?
      # FLASH MESSAGE
    end
  end
end
