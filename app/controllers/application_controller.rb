class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :signed_in_user
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
    
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  private 
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, locale: I18n.locale, notice: t(:please_sign_in)
      end
    end
    
    def admin_user
      redirect_to home_path, locale: I18n.locale unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
  
end
