class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you have logged in."
      redirect_to leads_path
    else
      flash.now[:error] = "Your username or password is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You haved logged out."
    redirect_to root_path
  end

end