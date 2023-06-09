class ApplicationController < ActionController::Base
  #before_action :is_matching_login_user, only:[:edit, :update,]
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  #def is_matching_login_user
  #  user =User.find(params[:id])
  #  unless user.id == current_user.id
  #    redirect_to books_path
  #  end
  #end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
  
end
