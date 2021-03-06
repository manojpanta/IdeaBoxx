class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:failed] = 'Username Already Taken!'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @ideas = @user.ideas
    else
      render :file => 'public/404.html'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
