class DestinationController < ApplicationController
	def index
		@destinations = Destination.all
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

	def destination_params
		params.require(:destinations).permit(:name, :address, :picture_path)
	end

	def create
		@destination = Destination.new(destination_params)

		@destination.save
			redirect_to :action => 'list'
	end

	def destination_param
		params.require(:destination).permit(:name, :address, :picture_path)
	end

	def update
		@destination = Destination.find(params[:id])

		@destination.update_attributes(destination_param)
			redirect_to :action => 'show', :id => @destination
	end

	def destroy
		Destination.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

end
