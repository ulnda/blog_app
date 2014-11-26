class Api::SessionsController < Devise::SessionsController
  def create
    @user = User.find_for_database_authentication(email: params[:user][:email])
    if @user && @user.valid_password?(params[:user][:password])
    	sign_in(@user)
    else
	    warden.custom_failure!
      @errors = [ 'Invalid email or password' ]
	    render 'api/shared/errors', status: :unauthorized
    end
	end
end
