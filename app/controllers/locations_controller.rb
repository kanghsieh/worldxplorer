class LocationsController < ApplicationController
  def index
    @user = current_user
    @locations = current_user.locations
  end
end
