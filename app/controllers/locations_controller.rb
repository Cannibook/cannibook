class LocationsController < ApplicationController
  def update
    new_location = MultiGeocoder.geocode(params[:zipcode])
    session[:geo_location] = new_location
    redirect_to index_path
  end

end
