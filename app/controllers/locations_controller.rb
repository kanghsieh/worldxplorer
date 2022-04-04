class LocationsController < ApplicationController
  before_action :set_user, only: %i[new create update]
  def index
    @user = current_user
    @locations_visited = UsersLocation.where(user: @user).visited
    @locations_wished = UsersLocation.where(user: @user).wished
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    @user_location = UsersLocation.create(
      user: @user,
      location: @location,
      visited: @location.status == "visisted",
      wished: @location.status == "wished"
    )
    @user_location.save
    @location.save
    if @location.save
      flash[:notice] = 'Your location was added.'
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def update
    @location = @user.locations.find(params[:id])
    @user_location = UsersLocation.where(user: @user).find(params[:id])
    if @location.status == "visited"
      @location.status = "wished"
      @user_location.visited = false
      @user_location.wished = true
    else
      @location.status = "visited"
      @user_location.visited = true
      @user_location.wished = false
    end
    @user_location.save
    @location.save
    if @location.save
      flash[:notice] = 'Your location was updated.'
    else
      flash[:notice] = 'Update error.'
    end
    redirect_to dashboard_path
  end

  private

  def location_params
    params.require(:location).permit(:address, :status)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
