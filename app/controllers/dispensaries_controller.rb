class DispensariesController < ApplicationController
  # Attempt to DRY up the controller, these methods have the same instance variable definition
  before_filter :find_dispensary, :only => [:show, :edit, :update, :destroy]
  
  def index
    @dispensaries = Dispensary.find(:all)
  end

  def show
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
