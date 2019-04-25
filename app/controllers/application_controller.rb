class ApplicationController < ActionController::Base

	# ログインしていないとルートパスへリダイレクト
	before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

# sign_in後のリダイレクト先変更
  def after_sign_in_path_for(resource)
  	  user_path(current_user)
  end

# sign_up後のリダイレクト先変更
  def after_sign_up_path_for(resource)
  	  user_path(current_user)
  end

  protected





  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :introduction])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :introduction])
  end

end
