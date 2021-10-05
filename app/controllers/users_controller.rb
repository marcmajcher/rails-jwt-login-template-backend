class UsersController < ApplicationController
  # Up here is where you will include any method you want to allow the app to invoke 
  # without checking if it's authorized first.

    skip_before_action :authorized, only: [:create]
   
    def create
      user = User.create(user_params)
     
      if user.valid?
        render json: { user: user, status: :created}
      else
        render json: { error: 'failed to create user', status: :not_acceptable}
      end
    end
  
  private
    
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
end