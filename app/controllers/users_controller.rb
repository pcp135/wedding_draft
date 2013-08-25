class UsersController < ApplicationController
  skip_before_action :signed_in_user, except: [:edit, :destroy, :index, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
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
  
  def update 
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end
  
  def edit
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
end
