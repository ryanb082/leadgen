class UsersController < ApplicationController

  before_action :set_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "You are registered"
    redirect_to leads_path
    else
      render :new
    end    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You profile has been updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end