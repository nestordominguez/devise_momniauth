class UsersController < ApplicationController
	

	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
 #     unless user
 #         user = User.create(name: data["name"],
 #            email: data["email"],
 #            password: Devise.friendly_token[0,20]
 #         )
 #     end
 #     user
	# end
 
	
end
