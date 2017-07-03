class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] ? remember(user) : forget(user)
      flash[:success] = "Welcome back #{user.username}"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email/password"
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
