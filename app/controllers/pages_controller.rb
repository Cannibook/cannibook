class PagesController < ApplicationController
  def index
    @loc = cookies[:geo_location]
    puts "YOOOOOOO: #{@loc}"
  end

  def about
    @title = 'About'
  end

end
