class PasswordResetsController < ApplicationController
  skip_before_action :signed_in_user
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:user][:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => t(:password_reset_mail_sent)
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 24.hours.ago
      redirect_to new_password_reset_path, :alert => t(:password_reset_expired)
    elsif @user.update_attributes(user_params)
      sign_in @user
      redirect_to root_url, :notice => t(:password_reset_success)
    else
      render :edit
    end
  end
  
end
