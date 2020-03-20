class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # ACCESS TO AVAILBILITY
    # WAY TO START NEW HANGOUT
  end

  def toggle_availability
    current_user.availability = !current_user.availability
    current_user.save

    redirect_to home_path
  end

  def mysettings
  end
end
