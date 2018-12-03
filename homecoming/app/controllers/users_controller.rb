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
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in(@user)
      redirect_to @user
    else
      render 'edit'
    end
  end
   def user_params
    params.require(:user).permit(:nickname, :email, :password,
                                 :password_confirmation, :picture_path)
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end


  def destroy
  end
end
