class CommentsController < ApplicationController
    before_action :set_comment, only: [:destroy]
    def create
        if params[:comment][:parent_id].to_i > 0
            parent = Comment.find_by id: params[:comment].delete(:parent_id)
            @comment = parent.children.build comment_params
            else
                @comment = Comment.new comment_params
            end
            if @comment.save
            print('save')
            respond_to do |format|
                # format.html{redirect_back(fallback_location: root_path)}
                format.js
            end
        end
    end

    def destroy
        # @comment.descendants.each do |comment_des|
        #   comment_des.destroy
        # end
        @comment = Comment.find(params[:id])
        @comment.destroy
        # @review = Review.find(params[:review_id])
        # redirect_to [@review.destination, @review]
        respond_to do |format|
            format.js
        end
    end

    private

    def set_comment
        @comment = Comment.find_by id: params[:id]
    end

    def comment_params
        params.require(
          :comment
        ).permit(
          :parent_id,
          :review_id,
          :content,
          :user_id
        )
    end
end
