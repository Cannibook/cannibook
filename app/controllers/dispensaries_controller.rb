class DispensariesController < ApplicationController
  # Attempt to DRY up the controller, these methods have the same instance variable definition
  before_filter :find_dispensary, :only => [:show, :edit, :update, :destroy]
  
  def index
    @dispensaries = Dispensary.find(:all)
  end

  def show
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.icon_global_init(GIcon.new(:image => '/images/weedleaf.png',
                                    :icon_size => GSize.new(48, 48),
                                    :icon_anchor => GPoint.new(24, 24),
                                    :info_window_anchor => GPoint.new(22, 0),
                                    :info_shadow_anchor => GPoint.new(18, 15)), "icon_source")
    icon_source = Variable.new("icon_source")
    
    @map.center_zoom_init([@dispensary.lat, @dispensary.lng],4)
    info = "<strong>#{@dispensary.name}</strong><br />" +
    "#{@dispensary.street}<br />" +
    "#{@dispensary.city} #{@dispensary.state}, #{@dispensary.zip}"
    
    @map.overlay_init(GMarker.new([@dispensary.lat, @dispensary.lng],
                      :title => "Hello",
                      :info_window => info,
                      :icon => icon_source))
  end

  def new
    @dispensary = Dispensary.new
  end

  def create
    @dispensary = Dispensary.new(params[:dispensary])
    
    respond_to do |format|
      if @dispensary.save
        flash[:success] = "Dispensary successfully created"
        format.html { redirect_to dispensary_url(@dispensary) }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @dispensary.update_attributes(params[:dispensary])
        flash[:success] = "#{@dispensary.name} successfully updated"
        format.html { redirect_to dispensary_url(@dispensary) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @dispensary.destroy
    
    respond_to do |format|
      flash[:success] = "#{@dispensary.name} successfully deleted"
      format.html { redirect_to dispensaries_url }
    end
  end

  # Used as a callback for jQuery-ui's autocomplete
  def list
    dispensaries = Dispensary.find(:all, :conditions => ["name like ?", params[:term]+"%"])
    result = []
    
    for d in dispensaries
      result << d.name
    end
    
    render(:json => result)
  end
  
  private
    
    def find_dispensary
      @dispensary = Dispensary.find(params[:id])
    end

end
