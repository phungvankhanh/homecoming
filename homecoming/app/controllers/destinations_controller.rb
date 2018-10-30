class DestinationsController < ApplicationController
  def index
    if params[:rates] != nil
      @destinations = Destination.filter(params[:rates])
    else
      @destinations = Destination.all 
    end
    @destinations = @destinations.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.js 
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
  private 
  def top_destination
    @destination = Destination.left_joins(:reviews).group(:id).order('COUNT(reviews.id) DESC').limit(4)
  end

  private 
  def best_destination
    @destination = Destination.left_joins(:reviews).group(:id).order('avg(reviews.rating) DESC').first()
  end

  private 
  def newest_destination
    @destination = Destination.order("created_at DESC").limit(5)
  end

  private
  def destination_params
    params.require(
      :destination
    ).permit(
      :name,
      :address,
      :speciality,
      :picture_path
    )

  end
end