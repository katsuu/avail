class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # ACCESS TO AVAILBILITY
    # WAY TO START NEW HANGOUT
  end
end
