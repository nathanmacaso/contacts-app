class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully Logged In.'
      redirect_to '/contacts'
    else
      flash[:warning] = 'Invalid Email Or Password.'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out.'
    redirect_to '/login'
  end
end
