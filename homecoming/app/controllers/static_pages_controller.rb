class StaticPagesController < ApplicationController
  def index
      @destinations = Destination.left_joins(:reviews).group(:id).order('COUNT(reviews.id) DESC')
    @destinations = @destinations.paginate(:page => params[:page], :per_page => 6)
    @hot_destinations= Destination.left_joins(:reviews).group(:id).order('avg(reviews.rating) DESC').limit(1)
    @new_destinations=Destination.order("created_at DESC").limit(3)
    end
  end
