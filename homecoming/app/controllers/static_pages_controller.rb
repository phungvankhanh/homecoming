class StaticPagesController < ApplicationController
  def index
    if params[:rates] != nil
      @destinations = Destination.filter(params[:rates])
    else
      @destinations = Destination.all 
    end
    @destinations = @destinations.paginate(:page => params[:page], :per_page => 6)
    @hot_destinations=Destination.all.limit(1)
    @new_destinations=Destination.all.limit(3).order("id DESC")
    end
  end
