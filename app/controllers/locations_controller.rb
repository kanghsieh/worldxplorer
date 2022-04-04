class LocationsController < ApplicationController
  def index
    @user = current_user
    @locations_visited = UsersLocation.where(user: @user).visited
    @locations_wished = UsersLocation.where(user: @user).wished
  end

  def new
    @user = User.find(params[:user_id])
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    @user = User.find(params[:user_id])
    @user_location = UsersLocation.create(
      user: @user,
      location: @location,
      visited: @location.status == "visisted",
      wished: @location.status == "wished"
    )
    @user_location.save
    @location.save
    if @location.save
      flash[:notice] = 'Your profile was updated.'
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private

  def location_params
    params.require(:location).permit(:address, :status)
  end
end
