class LocationsController < ApplicationController
  def index
    @user = current_user
    @locations = current_user.locations
  end

  def new
    @user = User.find(params[:user_id])
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    @user = User.find(params[:user_id])
    @user_location = UsersLocation.create(user: @user, location: @location, visited: true)
    @user_location.save
    @location.save
    if @location.save
      flash[:notice] = 'Your profile was updated.'
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:address)
  end
end
