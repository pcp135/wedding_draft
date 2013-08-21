class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :signed_in_user
  
  private 
    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
  
end
