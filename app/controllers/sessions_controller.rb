class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome back "+ user.name
      redirect_to root_path
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
  end
  
end
