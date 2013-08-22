class PasswordResetsController < ApplicationController
  skip_before_action :signed_in_user
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end
  
end
