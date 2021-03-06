class SessionsController < ApplicationController
  skip_before_action :signed_in_user, except: [:destroy]

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = t(:welcome_back) + user.name
      redirect_back_or home_path
    else
      flash.now[:error] = t(:invalid_password)
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to home_path
  end
  
end
