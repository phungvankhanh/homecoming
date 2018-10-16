class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
    Rails.logger.debug("My object: #{user_params}")
    @user = User.find(params[:id])
    log(user_params)
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'show'
    end
  end

  def destroy
  end
end
