class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:info]= 'You are already logged in.'
      redirect_to thoughts_path
    end
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Logged in successfully!'
      redirect_back_or thoughts_path
    else
    	flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out
    flash[:success]= 'Logged out successfully.'
    redirect_to login_url
  end
end
