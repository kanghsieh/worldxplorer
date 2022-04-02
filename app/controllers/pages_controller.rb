class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    @user = current_user
    @locations = current_user.locations

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(
          partial: "info_window",
          locals: { location: location }
          # image_url: helpers.asset_url("kang.png")
        )
      }
    end
  end
end
