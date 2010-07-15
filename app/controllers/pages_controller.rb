class PagesController < ApplicationController
  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => false)
    @map.icon_global_init(GIcon.new(:image => 'http://google.com/mapfiles/ms/icons/red-pushpin.png',
                                    :icon_size => GSize.new(32, 32),
                                    :shadow_size => GSize.new(37, 32),
                                    :icon_anchor => GPoint.new(9, 32),
                                    :info_window_anchor => GPoint.new(9, 2),
                                    :info_shadow_anchor => GPoint.new(18, 25)), "icon_source")
    icon_source = Variable.new("icon_source")
    
    @map.center_zoom_init([@user_location[:lat], @user_location[:lng]],8)
    # info = "<strong>TEST</strong><br />"
    # 
    # @map.overlay_init(GMarker.new([@user_location[:lat], @user_location[:lng]],
    #                   :title => "Hello",
    #                   :info_window => info,
    #                   :icon => icon_source))
  end

  def about
    @title = 'About'
  end

end
