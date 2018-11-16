class StaticPagesController < ApplicationController
  def index
      @destinations = Destination.left_joins(:reviews).group(:id).order('COUNT(reviews.id) DESC').where('state',1)
    @destinations = @destinations.paginate(:page => params[:page], :per_page => 9)
    @hot_destinations= Destination.where('state',1).left_joins(:reviews).group(:id).order('avg(reviews.rating) DESC').limit(1)
    @new_destinations=Destination.where('state',1).order("created_at DESC").limit(3)
    end
  end
