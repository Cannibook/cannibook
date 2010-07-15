class PagesController < ApplicationController
  def index
    # find the dispensaries within 20 miles of the users location
    @dispensaries = Dispensary.find(:all, 
                                    :origin => [@user_location[:lat], @user_location[:lng]], 
                                    :within => 20)
    
    puts "DEBUGGG:" + @dispensaries.inspect

    # set up the map
    @map = GMap.new("map_div")
    @map.control_init(:large_map => false)
    
    # set up the users location
    @map.icon_global_init(GIcon.new(:image => 'http://google.com/mapfiles/ms/icons/red-pushpin.png',
                                    :icon_size => GSize.new(32, 32),
                                    :shadow_size => GSize.new(37, 32),
                                    :icon_anchor => GPoint.new(9, 32),
                                    :info_window_anchor => GPoint.new(9, 2),
                                    :info_shadow_anchor => GPoint.new(18, 25)), "icon_source")
    icon_source = Variable.new("icon_source")
    @map.overlay_init(GMarker.new([@user_location[:lat], @user_location[:lng]],
                      :title => "Users Location",
                      :info_window => "You searched for",
                      :icon => icon_source))
                      
    # set up the dispensary locations
    markers = []
    @dispensaries.each do |dispensary|
      info = "<strong>#{dispensary.name}</strong><br />" +
      "#{dispensary.street}<br />" +
      "#{dispensary.city} #{dispensary.state}, #{dispensary.zip}"
      markers << GMarker.new([dispensary.lat, dispensary.lng],
                             :title => dispensary.name,
                             :info_window => info)
    end
    puts "DEBUG MARKERS:" + markers.inspect
    @map.overlay_global_init(GMarkerGroup.new(true, markers), "dispensary_markers")
    
    # zoom to center
    @map.center_zoom_init([@user_location[:lat], @user_location[:lng]],11)
  end

  def about
    @title = 'About'
  end

end
