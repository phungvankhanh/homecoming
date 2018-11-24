class DestinationsController < ApplicationController
  def index
    if !params[:rates].blank? && !params[:categories].blank?
      @destinations = Destination.filter(params[:rates],params[:categories],params[:search])
      @destinations = @destinations.paginate(:page => params[:page], :per_page => 9)
    elsif params[:rates].blank? && params[:categories].blank? && params[:search].blank?
      @destinations = Destination.all
      @destinations = @destinations.paginate(:page => params[:page], :per_page => 9)
    else
      @destinations = []
    end
     
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.state = 1
    if @destination.save
      flash[:message] = "Request to create new destination: \"#{@destination.name}\" successfully"
      flash[:flash] = "success"
      redirect_to :action => 'index'
    else
      render :action =>'new'
    end
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update_attributes(destination_param)
      redirect_to :action => "show", :id => @destination
    else
      render :action => 'edit'
    end
  end

  def destroy
    Destination.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  def top_page
    @top_destination = top_destination()
    @newest_destination = newest_destination()
    @best_destination = best_destination()
  end

  def search
  	if params[:search].blank? 
      redirect_to(destinations_path, alert: "Emptyfffffffffffffffff field!") and return  
    else  
      @parameter = params[:search].downcase  
      @destinations = Destination.all.where("lower(name) LIKE :search or lower(address) LIKE :search", search: "%#{@parameter}%").paginate(:page => params[:page], :per_page => 9) 
      render 'destinations/index'
    end  
  end

  private
  def destination_params
    params.require(
      :destination
    ).permit(
      :name,
      :image,
      :address,
      :speciality
    )

  end
end