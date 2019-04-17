class RegistrationsController < ApplicationController
	def new
    	@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		  flash[:success] = "You have registrated saccesfully! :)"
		  
		  redirect_to @user
		  render json: @user
		else
		  render 'new'
		  flash[:error] = "Try again :("
		end
	end

	def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
