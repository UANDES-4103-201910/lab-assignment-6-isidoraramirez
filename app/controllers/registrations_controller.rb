class RegistrationsController < ApplicationController
	def new
    	#@user = User.new
	end

	def create
		user = User.new(reg_params)
		if user.save
		  flash[:success] = "You have registrated saccesfully! :)"
		  redirect_to root_url

		else

		  flash[:error] = "Try again :("
		  redirect_to registrations_url
		end
	end

	def reg_params
	    	params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
