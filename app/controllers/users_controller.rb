class UsersController < ApplicationController
  skip_before_action :signed_in_user, except: [:index, :edit, :update]
  #before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:edit, :update]
  
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
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
    @user=User.find(params[:id])
  end

  def edit
  end
  
end
