class PagesController < ApplicationController
  def index
    puts @user_location.inspect
    @map = GMap.new("map_div")
    @map.control_init(:large_map => false)
    @map.icon_global_init(GIcon.new(:image => '/images/weedleaf.png',
                                    :icon_size => GSize.new(48, 48),
                                    :icon_anchor => GPoint.new(24, 24),
                                    :info_window_anchor => GPoint.new(22, 0),
                                    :info_shadow_anchor => GPoint.new(18, 15)), "icon_source")
    icon_source = Variable.new("icon_source")
    
    @map.center_zoom_init([@user_location[:lat], @user_location[:lng]],8)
    info = "<strong>TEST</strong><br />"
    
    @map.overlay_init(GMarker.new([@user_location[:lat], @user_location[:lng]],
                      :title => "Hello",
                      :info_window => info,
                      :icon => icon_source))
  end

  def about
    @title = 'About'
  end

end
