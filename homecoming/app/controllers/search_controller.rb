class SearchController < ApplicationController
  def index
  	if params[:search].blank? 
    redirect_to(destinations_path, alert: "Emptyfffffffffffffffff field!") and return  
  else  
@parameter = params[:search].downcase  
    @results = Destination.all.where("lower(name) LIKE :search or lower(address) LIKE :search", search: "%#{@parameter}%")  
  end  
end
end

