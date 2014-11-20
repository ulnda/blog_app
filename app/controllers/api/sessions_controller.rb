class Api::SessionsController < Devise::SessionsController
    def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
    	sign_in(user)
    	render json: user
    else
	    warden.custom_failure!
	    render json: { errors: [ 'Invalid email or password' ] }, status: :unauthorized
    end
	end
end
