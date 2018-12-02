class NewsController < ApplicationController

    def index
        @group = Group.find(params[:group_id])
        redirect_to group_path(@group)
    end

    def show
        @news = News.find(params[:id])
    end

    def new
        group_id = params[:group_id]
        @group = Group.find(group_id)
        @news = @group.news.build
        @user = User.find(1)
        @news.user = @user
    end

    def edit
        @news = News.find(params[:id])
    end

    def create
        @group = Group.find(params[:group_id])
        @news = @group.news.build(news_params)
        @user = User.find(params[:news][:user_id])
        @news.user = @user
        if @news.save
            flash[:message] = "Create new news \"#{@news.title}\" successfully"
            flash[:flash] = "success"
            redirect_to group_path(@group)
        else
            render :action =>'new'
        end
    end

    def update
        @news = News.find(params[:id])
        if @news.update(news_params)
            redirect_to group_path(@news.group)
        else
            render :action =>'edit'
        end
    end

    def destroy
        @news = News.find(params[:id])
        if @news.destroy
            flash[:message] = "Delete news \"#{@news.title}\" successfully"
            flash[:flash] = "success"
        else
            flash[:message] = "Can not delete news \"#{@news.title}\" successfully"
            flash[:flash] = "danger"
        end
        
        redirect_to group_path(@news.group)
    end

    private
    def news_params
        params.require(
          :news
        ).permit(
          :title,
          :content,
          :user_id
        )
    end
end
