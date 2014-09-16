class Users::RegistationsControllers < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters if :devise_controller?

  protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }	
	end

	private
 
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
