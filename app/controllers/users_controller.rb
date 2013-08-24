class UsersController < ApplicationController
  skip_before_action :signed_in_user, except: [:index]
  before_action :admin_user, only: [:index]
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      @user.send_welcome
      flash[:success] = t(:welcome) + @user.name
      redirect_to root_path
    else
      render 'new'
    end
  end
  
end
