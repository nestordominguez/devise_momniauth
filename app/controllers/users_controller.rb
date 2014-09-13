class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(name: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20]
         )
     end
     user
	end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
	
end
