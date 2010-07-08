class StrainsController < ApplicationController
  # Attempt to DRY up the controller, these methods have the same instance variable definition
  before_filter :find_strain, :only => [:show, :edit, :update, :destroy]
  
  def index
    @strains = Strain.find(:all)
  end

  def show
  end

  def new
    @strain = Strain.new
  end

  def create
    @strain = Strain.new(params[:strain])
    
    respond_to do |format|
      if @strain.save
        flash[:success] = "Strain successfully created"
        format.html { redirect_to strain_url(@strain) }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @strain.update_attributes(params[:strain])
        flash[:success] = "#{@strain.name} successfully updated"
        format.html { redirect_to strain_url(@strain) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @strain.destroy
    
    respond_to do |format|
      flash[:success] = "#{@strain.name} successfully deleted"
      format.html { redirect_to strains_url }
    end
  end
  
  private
    
    def find_strain
      @strain = Strain.find(params[:id])
    end

end
