class UsersController < ApplicationController
  skip_before_action :signed_in_user
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to our wedding website " + @user.name
      redirect_to root_path
    else
      render 'new'
    end
  end
  
end
