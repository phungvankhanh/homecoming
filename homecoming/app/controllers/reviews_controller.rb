class ReviewsController < ApplicationController
    def index
        @destination = Destination.find(params[:destination_id])
        redirect_to destination_path(@destination)
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        destination_id = params[:destination_id]
        @destination = Destination.find(destination_id)
        @review = @destination.reviews.build
        @review.rating = 1
        @user = User.find(1)
        @review.user = @user
    end

    def edit
        @review = Review.find(params[:id])
    end

    def create
        @destination = Destination.find(params[:destination_id])
        @review = @destination.reviews.build(review_params)
        @user = User.find(params[:review][:user_id])
        @review.user = @user
        if @review.save
            flash[:message] = "Create new review \"#{@review.title}\" successfully"
            flash[:flash] = "success"
            redirect_to destination_path(@destination)
        else
            render :action =>'new'
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to destination_path(@review.destination)
        else
            render :action =>'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        if @review.destroy
            flash[:message] = "Delete review \"#{@review.title}\" successfully"
            flash[:flash] = "success"
        else
            flash[:message] = "Can not delete review \"#{@review.title}\" successfully"
            flash[:flash] = "danger"
        end
        
        redirect_to destination_path(@review.destination)
    end

    private
    def review_params
        params.require(
          :review
        ).permit(
          :title,
          :rating,
          :content
        )
    end
end
