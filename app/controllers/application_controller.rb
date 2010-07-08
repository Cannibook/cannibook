# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
include Geokit::Geocoders

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  geocode_ip_address # grab the users ip and stick in a session/cookie
  
  before_filter :geokit
  
  private
    
    def geokit
      @user_location = session[:geo_location].hash
    end
  
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
